# -*- coding: utf-8 -*-
class FactsController < ApplicationController

  before_filter :authenticate_user!

  def index
    puts current_user.inspect
    @fact = Fact.new
    if current_user.admin?
      @facts = Fact.all(:order => "created_at DESC")
    else
      @facts = []
    end
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
    @fact = Fact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fact }
    end
  end

  # GET /facts/new
  # GET /facts/new.json
  def new
    @fact = Fact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fact }
    end
  end

  # GET /facts/1/edit
  def edit
    @fact = Fact.find(params[:id])
  end

  def create
    @fact = Fact.new(params[:fact])
    if @fact.save
      redirect_to facts_path, notice: 'Ideia criada com sucesso.'
    else
      redirect_to facts_path, alert: 'Não pode ser branco.'
    end
  end

  def update
    @fact = Fact.find(params[:id])
    if @fact.update_attributes(params[:fact])
      redirect_to facts_path, notice: 'Ideia atualizada!.'
    else
      redirect_to facts_path, error: @fact.errors
    end
  end

  def destroy
    @fact = Fact.find(params[:id])
    @fact.destroy
    redirect_to facts_path, alert: 'Ideia apagada! Mas lembre-se que em um brainstorm tudo é válido!'
  end

end
