defmodule PaperTrail.RepoClient do
  @doc """
  Gets the repo from options or falls back to configured default.

  ## Examples

      iex> RepoClient.repo()
      MyApp.Repo

      iex> RepoClient.repo(repo: CustomRepo)
      CustomRepo
  """
  def repo(opts \\ [])
  def repo([]), do: env(:repo, Repo)
  def repo(opts) when is_list(opts), do: opts[:repo] || env(:repo, Repo)

  def originator(opts \\ []), do: opts[:originator] || env(:originator, nil)
  def strict_mode(opts \\ []), do: opts[:strict_mode] || env(:strict_mode, false)
  def item_type(opts \\ []), do: opts[:item_type] || env(:item_type, :integer)
  def originator_type(opts \\ []), do: opts[:originator_type] || env(:originator_type, :integer)
  def originator_relationship_opts(opts \\ []), do: opts[:originator_relationship_options] || env(:originator_relationship_options, [])
  def timestamps_type(opts \\ []), do: opts[:timestamps_type] || env(:timestamps_type, :utc_datetime)
  def origin_read_after_writes(opts \\ []), do: opts[:origin_read_after_writes] || env(:origin_read_after_writes, true)

  defp env(k, default), do: Application.get_env(:paper_trail, k, default)
end
