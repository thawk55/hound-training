defmodule HoundTraining.MixProject do
  use Mix.Project

  def project do
    [
      app: :hound_training,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:hound, "~> 1.0.4"},
      {:mix_test_watch, "~> 0.8"}
    ]
  end
end
