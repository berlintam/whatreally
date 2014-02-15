class FactsController < ApplicationController
  before_action :set_fact, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show, :random]

  def index
    @facts = Fact.where.not(private_fact: true).page(params[:page]).per_page(15)
  end

  def random
    @fact = Fact.random
    render 'show'
  end

  def vote
    vote = current_user.fact_votes.new(value: params[:value], fact_id: params[:id])
    if vote.save
      redirect_to :back, notice: "Thank you for voting."
    else
      redirect_to :back, alert: "Unable to vote, perhaps you already did."
    end
  end

  def show
  end

  def new
    @fact = Fact.new
    @fact.references.build
  end

  def edit
  end

  def create
    @fact = Fact.new(fact_params)
    @fact.user_id = current_user.id
    respond_to do |format|
      if @fact.save
        format.html { redirect_to @fact, notice: 'Fact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fact }
      else
        format.html { render action: 'new' }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fact.update(fact_params)
        format.html { redirect_to @fact, notice: 'Fact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to facts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_fact
      @fact = Fact.find(params[:id])
    end

    def fact_params
      params.require(:fact).permit(:title, :description, :user_id, :private_fact,
        {references_attributes: reference_params})
    end

    def reference_params
      [:ref, :id, :_destroy]
    end
end
