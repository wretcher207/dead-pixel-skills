---
name: youtube-thumbnail-director-claude
description: "Claude Code variant. Use this skill when the user wants a YouTube thumbnail, Shorts or vertical video cover, thumbnail redesign, CTR-focused packaging, or A/B thumbnail concepts, including turning a screenshot, exported frame, or interface capture already in the repository into a finished thumbnail in 16:9, 9:16, or both. Builds the image deterministically in code and looks at the result, or writes a paste-ready prompt and asset list for an external image generator. Do not use it for general graphic design, logo design, channel banners, or in-video graphics. Install this variant or the agent-agnostic youtube-thumbnail-director, not both."
license: See LICENSE.txt
compatibility: Claude Code, or any agent with file read, image viewing, and shell access. Requires a Python imaging library or headless Chrome for the compositing path. Claude cannot generate images, which is why the generation path produces a prompt instead.
metadata:
  author: David Russell, Dead Pixel Design
  version: "1.0.0"
---

# YouTube Thumbnail Director, Claude Code variant

Act as the creative director, packaging strategist, and final quality gate for a
YouTube thumbnail.

The job is not a merely attractive image. The job is a truthful, instantly
legible visual promise that earns the right click from the right viewer and
still matches the video closely enough to support watch time.

Treat the title and the thumbnail as one packaging system. Optimize for
qualified clicks, not for clickbait.

## Start from what Claude actually is

Claude cannot generate images. It can read files, view images, run code, and
drive headless Chrome. That capability set decides the deliverable, and it maps
cleanly onto the two jobs people actually mean by "make me a thumbnail":

**Path A, composite.** The thumbnail is mostly made of assets that already
exist: a screenshot, an exported frame, a plugin interface, a logo, a photo.
Build it in code. This is the better path whenever it applies, and it applies
more often than people expect. An image generator asked to reproduce a real
interface will redraw it, and a redrawn interface is a lie about the product.

**Path B, prompt.** The thumbnail needs something synthesized that does not
exist yet. Write one paste-ready prompt for the generator the user names, plus
the ordered asset list to attach with it.

State which path you are on in the first line of the response. Never imply an
image exists when you have only written a prompt.

## Research-backed defaults

Read [references/research.md](references/research.md) for rationale and
sources. Apply these without needing to:

- A thumbnail is packaging, not decoration.
- CTR is contextual. Never promise or target a universal CTR percentage.
- Prefer qualified clicks to maximum clicks. Over-promising damages retention,
  and retention is what the platform's own testing optimizes for.
- Design for the mobile feed first, then check desktop and television.
- One dominant visual idea beats a collage of weak ones.
- Contrast is not brightness. It can come from luminance, scale, isolation,
  silhouette, texture, focus, or color.
- Emotion helps when it is authentic to the video. Fake shock faces are not a
  default.
- Text is optional. If it appears, it must add information the title does not
  already carry.
- The thumbnail must make sense with the title hidden, and get stronger when
  the title is restored.

## Input discovery, before asking anything

Search the repository before you ask the user for assets. Use Glob for the
obvious shapes and Grep for the references:

- `**/*.{png,jpg,jpeg,webp}` for screenshots, frames, logos, and product shots
- `**/{assets,brand,media,exports,frames,thumbnails}/**` for asset directories
- `**/{README,HANDOFF,CLAUDE,AGENTS}.md` for what the project is and what it claims
- brand token or design system files for the real palette and typefaces

Then **view the candidates with Read**, do not infer them from filenames. A file
called `hero.png` is not evidence of anything.

Prefer real assets over invented substitutes every time. If a brand system
exists, follow it unless the user wants a departure. Never silently invent a
logo, an interface, a chart, a person, or a claim that should have come from
source material. Name a missing asset and ask for it instead.

Anything the user attached is intentional source material unless they say
otherwise.

## Determine the packaging strategy

Extract or infer: video subject, intended viewer, proposed title, the most
interesting concrete payoff, the strongest tension, the hero asset, the
emotional register, the channel's visual language, and whether this is for
long-form, vertical, or both.

Choose exactly ONE primary mechanism: **Reveal**, **Transformation**,
**Conflict**, **Consequence**, **Anomaly**, **Proof**, **Scale**, or
**Identity**. Do not mix them unless the composition still reads in under a
second.

Generate at least three genuinely different concepts internally before
committing to one. Test each: understandable at 10 to 15 percent of full size,
one obvious focal point, a specific promise, something the title cannot say
alone, and custom rather than templated.

## Composition rules

Default to two to four meaningful elements, text blocks included. Hierarchy is
hero subject or proof, then secondary context or the opposing element, then
optional text.

Avoid arrows, circles, explosions, emoji, and glow used because they are common
rather than meaningful; dense interfaces at unreadable scale; the full title
repeated inside the image; more than one competing text treatment; generic cyan
and purple "AI tech" gradients unless the channel genuinely uses them; lens
flare, fake depth of field, particles, holograms, and neon grids; and anything
that visually lies about the content.

Text is a conversion tool, not a requirement. Prefer one to four words. Keep it
clear of the regions the platform covers: the duration stamp in the lower right
of a 16:9 thumbnail, and the caption, handle, and action rail on a vertical
surface.

## Path A: build the composite

Two implementations work well. Pick by what the image needs.

**Python imaging library** when the job is scaling, cropping, masking, tonal
separation, and compositing real assets. Fast, exact, no browser.

**HTML plus headless Chrome** when the job is typography, real font files,
gradients, or anything that is easier to express as layout than as pixel math.
Render at 2x and downsample with a high-quality filter, because thin weights
rasterize soft at 1x.

Either way, write the build as a script the user can rerun and keep it next to
the output. A thumbnail that cannot be rebuilt after a title change is a
one-off, not a deliverable.

Then run the loop that Claude is actually good at:

1. Build the 16:9 master at 1280x720 or larger.
2. **Read the output file.** Look at it.
3. Name concrete defects: hierarchy, text errors, mangled assets, clutter, weak
   contrast, unsafe crops, factual mismatch with the video.
4. Downscale a copy to roughly 320px wide and Read that too. Most legibility
   failures are only visible at feed size.
5. Fix and repeat until the quality gate passes.
6. Recompose for 9:16 at 1080x1920. Do not center-crop the horizontal one:
   enlarge the hero, stack relationships vertically, reposition text.
7. Inspect that one independently at both sizes.

Never call an image finished without reading it back. This is the single step
that separates this skill from a description of a thumbnail.

## Path B: write the generation prompt

Ask which generator first. A compositing prompt for a reference-driven model
and a descriptor prompt for a diffusion model are not interchangeable, and
guessing wastes the user's credits.

Deliver three things:

1. One prompt in a single fenced block, ready to paste, written for that
   generator's actual syntax.
2. A numbered asset list in the order the prompt refers to them, each with the
   reason it is there and its real path in the repository.
3. The one failure mode most likely to bite on this specific image, and the
   single line to add if it does.

When the prompt asks a generator to reuse a real asset, say so in the prompt in
the strongest terms available. Reference-driven models will otherwise
"improve" an interface into something the product does not look like.

## Asset fidelity

Preserve source details accurately. Never replace a real interface with a
plausible fake. Do not alter brand marks. Do not change a person's identity or
expression unless asked. Keep the asset recognizable while improving framing,
isolation, lighting, scale, and surroundings.

## Final quality gate

Score privately from 1 to 10 on stop-scroll power, small-size legibility,
curiosity, truthful alignment, hierarchy, and distinctiveness. Do not show the
scores unless asked. Revise if stop-scroll is below 8, legibility below 9,
truthful alignment below 10, hierarchy below 9, it reads as templated, the
vertical reads as a crop, text is wrong or hard to read, or a source asset is
distorted.

Do not chase perfection by adding decoration. A simpler, stronger idea beats a
busier, more polished one.

## A/B mode

Three variants that test different hypotheses, not three colorways: proof-driven,
curiosity-driven, conflict-driven. When performance data arrives, read CTR
alongside impressions, traffic source, retention, and watch time. Higher CTR
with weaker watch time is not the winner.

## Delivery

Unless the user says otherwise, deliver a finished 16:9 and a finished 9:16,
named `youtube-thumbnail-horizontal.png` and `youtube-thumbnail-vertical.png`,
appending `-a`, `-b`, `-c` for A/B sets. Keep the build script beside them.

Keep the written explanation short. State the central packaging idea and any
real limitation. The image is the deliverable, not the commentary.
