class RenameSynopsisToPlotSynopsis < ActiveRecord::Migration[5.0]
  def change
    rename_column "movies", "synopsis", "plot_synopsis"
  end
end
