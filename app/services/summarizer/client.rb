require 'smmrize'
require 'cgi'

module Summarizer
  class Client
    # Return type
    # {"sm_api_character_count"=>"917",
    #  "sm_api_title"=>"",
    #   "sm_api_content"=>
    #     " Plans to build the first new UK nuclear plant in 20 years have suffered an unexpected delay after the government postponed a final decision until the early autumn. French firm EDF, which is financing most of the 18bn Hinkley Point project in Somerset, approved the funding at a board meeting. Business Secretary Greg Clark has said the government will \"Consider carefully\" before backing it. EDF chief executive Vincent de Rivaz has cancelled a trip to Hinkley Point on Friday following Mr Clark's comments. Hours after EDF's board voted to approve the 18bn power plant on Thursday, the government launched a further review of the project. This stunning new development came all the way from the top of government and the timing seemed calculated to cause maximum impact. Is it a genuine pause for a new government to read the small print of a project that is two administrations old, or a signal of a potential change in policy?",
    #      "sm_api_limitation"=>
    #        "Waited 0 extra seconds due to API limited mode, 24 requests left to make for today."}
    def summarize payload
      summarized_document = Smmrize.document(
        input: sample_text
      )
    end

    def sample_text
      <<-EOF
Plans to build the first new UK nuclear plant in 20 years have suffered an unexpected delay after the government postponed a final decision until the early autumn.
French firm EDF, which is financing most of the £18bn Hinkley Point project in Somerset, approved the funding at a board meeting.
Contracts were to be signed on Friday.
But Business Secretary Greg Clark has said the government will "consider carefully" before backing it.
EDF chief executive Vincent de Rivaz has cancelled a trip to Hinkley Point on Friday following Mr Clark's comments.
Critics of the plan have warned of environmental damage and potential escalating costs.
They are also concerned that the plant is being built by foreign governments. One third of the £18bn cost is being provided by Chinese investors.
Analysis: Simon Jack, BBC business editor
Hours after EDF's board voted to approve the £18bn power plant on Thursday, the government launched a further review of the project.
This stunning new development came all the way from the top of government and the timing seemed calculated to cause maximum impact.
EDF executives were taken completely off guard, the post-Brexit run of major investment is abruptly halted and what precious entente cordiale in Anglo-French relations there is left after the EU referendum result seems diminished.
Is it a genuine pause for a new government to read the small print of a project that is two administrations old, or a signal of a potential change in policy?
Simon Jack: Hinkley delay is a high stakes bet
graphic
Tom Greatrex, the chief executive of the Nuclear Industry Association, urged the government to make a decision as soon as possible.
"We need to get on and do this and that's why I'm hoping the government make their decision very soon because if it goes on for a lengthy period of time we are going to run the risk of having real problems in terms of our energy supplies," he said.
"Then what happens is that we end up paying a lot more and we end up paying for much more dirty power which we can't afford to do if we are to meet our climate commitments."
Claire Jacobson, head of climate, energy and environment policy at the EEF manufacturers' organisation said the government's decision was "yet another blow to a decision that has been hindered by many delays and uncertainties".
Why is Hinkley Point important?
Somerset hopes for Hinkley jobs boost
Cost warning
Hinkley Point C is expected to provide 7% of the UK's total electricity requirement.
Announcing the approval of investment on Thursday, EDF had described the plant as "a unique asset for French and British industries", saying it would benefit the nuclear sectors in both countries and would give a boost to employment.
However, the project has been hit in recent months by concerns about EDF's financial capacity.
Despite the Chinese investment, Hinkley Point would remain an enormous undertaking for the stressed French company, which has had to raise money from its owners.
Earlier this week, EDF shareholders approved plans to issue new shares to raise €4bn (£3.4bn) to help pay for the project.
Ahead of Thursday's vote on whether to approve the project, an EDF board member, Gerard Magnin, resigned, saying the project was "very risky" financially.
Earlier this year, EDF's finance director, Thomas Piquemal, had resigned amid reports he thought Hinkley could damage EDF itself.
      EOF
    end
  end
end
