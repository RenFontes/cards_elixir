
defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

   @doc """
    Returns a list of strings that represents a deck of playing cards.
    Cards generated are of all four suits and from Ace to Five.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Returns a shuffled deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Nine of Hearts")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates hoy many cards should be dealt to a hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves deck to file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads deck from a file.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist."
    end
  end

  @doc """
    Creates a deck, shuffles it and deals a hand.
  """
  def createHand(hand_size) do
    {hand, rest_of_deck} = create_deck() |> shuffle() |> deal(hand_size)
    {hand, rest_of_deck}
  end
end
