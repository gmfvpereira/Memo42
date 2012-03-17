# -*- coding: utf-8 -*-
class FactsController < ApplicationController

  def index
    @fact = Fact.new
    @facts = Fact.all
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

  # POST /facts
  # POST /facts.json
  def create
    @fact = Fact.new(params[:fact])

    respond_to do |format|
      if @fact.save
        format.html { redirect_to facts_path, notice: 'Fato criado com sucesso.' }
      else
        format.html { render action: "new" }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fact = Fact.find(params[:id])
    if @fact.update_attributes(params[:fact])
      format.html { redirect_to @fact, notice: 'Fact was successfully updated.' }
    else
      format.html { render action: "edit" }
    end
  end

  def destroy
    @fact = Fact.find(params[:id])
    @fact.destroy
    redirect_to facts_path, alert: 'Fato apagado! Mas lembre-se que apagar sua memória pode ser perigoso! =)'
  end

end
