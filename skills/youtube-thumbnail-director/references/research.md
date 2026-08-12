# YouTube thumbnail research notes

These notes support the operating rules in the main skill. They are deliberately
concise so the skill stays useful rather than academic.

## The platform's own metric guidance

- Impressions click-through rate measures how often people watch after seeing a
  registered thumbnail impression. YouTube warns creators not to judge CTR
  without context, because traffic source, audience, and distribution all move it.
- YouTube's creator guidance describes the thumbnail and title together as the
  video's packaging. When CTR is low, the lever is testing a different thumbnail
  or title.
- CTR can fall while a video reaches a much broader audience and absolute views
  improve. A universal target percentage is therefore misleading.
- YouTube says directly that high CTR paired with low retention can mean the
  thumbnail promised something the video did not deliver.

## What that implies for A/B testing

YouTube's native title and thumbnail testing optimizes for watch time, not for
clicks. The reason matters more than the mechanism: the thumbnail has to make a
promise the video fulfills. A thumbnail that wins clicks and loses viewers is
not the winner.

So this skill optimizes for **qualified click-through**: attention, relevance,
and a fulfilled expectation.

## Visual research

Large-sample research on video thumbnail imagery suggests visual attributes
affect viewer response. Studies on YouTube-scale datasets have identified
thumbnail contrast among features associated with popularity, though popularity
is multi-factorial and none of this should be read as a causal design recipe.

A 2024 study of 16,215 YouTube video covers reported that stronger sentiment
expressed in the thumbnail was associated with more views. That supports using
clear emotional or visual tension when it is authentic to the content, not
manufacturing a shocked face for every topic.

## Practical interpretation

The evidence supports a few durable principles far more strongly than
viral-thumbnail folklore:

1. Title and thumbnail work as one unit.
2. The design has to earn attention at small size.
3. Visual hierarchy and contrast matter.
4. A clear emotional or informational signal helps.
5. Misleading packaging is counterproductive, because downstream watch behavior
   is what gets measured.
6. Testing beats pretending any single visual formula is universally optimal.

## Sources

Primary and official:

- YouTube Help: Impressions and click-through rate FAQs
- YouTube Help: A/B test titles and thumbnails
- YouTube Blog: Stop guessing, start growing: Master these 4 metrics (2025)
- YouTube Creator Liaison, on why Thumbnail Test and Compare evaluates watch time

Research:

- Koh et al. (2022), Information and Management: visual attributes and thumbnail
  persuasion
- Cui et al. (2024), Journal of Business Research: sentiment analysis of 16,215
  YouTube video covers
- Hoiles, Aprem and Krishnamurthy (2016): engagement dynamics across roughly 6
  million YouTube videos, with thumbnail contrast among the predictive
  meta-level features

## Why the skill is shaped this way

Agent Skills are progressively disclosed, so the trigger description stays short
and specific while the deeper rationale lives here. Each skill should cover one
recognizable job with clear inputs and outputs.

The capability check at the top of the skill exists because the same request
lands on agents with very different powers. Some can generate images, some can
only run code, some can do neither. A skill that assumes generation produces
confident nonsense on an agent that cannot generate, and the most common failure
is an agent describing an image it never made. Naming the deliverable in the
first line is the cheapest fix for that.

The preference for compositing real assets over generating them is not
aesthetic. Reference-driven image models redraw interfaces they are asked to
reproduce, and a redrawn interface misrepresents the product the video is about.
That is a truthfulness problem before it is a quality problem.
