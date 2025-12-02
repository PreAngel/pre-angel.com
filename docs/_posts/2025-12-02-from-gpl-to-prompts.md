---
title: "From GPL to Prompts: Rethinking Open Source Licenses for the AI-Native Era"
excerpt: "How a 30-year open source hacker ended up drafting a 'Prompt Public License' for AI agents."
author: huan-li
category: opensource
tags: [opensource, license, ai, prompt-engineering]
image: assets/2025/12-from-gpl-to-prompts/teaser.webp
---

> The hottest new programming language is English.  
> — Andrej Karpathy, [January 24, 2023](https://x.com/karpathy/status/1617979122625712128)

He wasn’t joking: The Day English Became a Programming Language.

Today, I can ship a surprisingly powerful product by wiring up:

* a few **system prompts**,
* some **tool descriptions**,
* a handful of **example dialogues**,
* and a half-decent UX.

90% of the “code” is just **natural language**.

As someone who has lived through almost **three decades of open source**, watching this shift feels… theological. We spent years arguing about which license covers:

* object files,
* shared libraries,
* network services,
* cloud providers.

Now we’re staring at a new question:

> **What does “copyleft” even mean when the core of your system is a *paragraph* that says, “You are an AI agent that does X, Y, Z…”?**

This post is my attempt to answer that question — and to sketch the first draft of a **Prompt Public License (PPL)** for the AI-native era.

---

## 1. MIT vs Apache: Two Sides of the Permissive Coin

Before we jump to AI and prompts, I want to ground the discussion in something familiar: **MIT** and **Apache-2.0**.

They’re both called “permissive” licenses, and in practice they both allow:

* commercial use,
* closed-source products,
* modification and redistribution.

So why do we need both?

### 1.1 MIT: pure freedom, almost no strings

The **MIT License** is basically:

> *“Do whatever you want, just keep my name and this short license text. No warranty.”*

There is:

* no explicit patent grant,
* no requirement to mark modified files,
* no NOTICE file.

Its close cousin, the **ISC License**, is essentially a slightly shorter, more modern rewrite of MIT with the same practical effect. When I say “MIT” in this post, you can mentally read it as **“MIT / ISC”** — the ultra-lightweight permissive family.

From a developer’s point of view, MIT/ISC is:

* frictionless,
* easy to read,
* easy to copy into tiny projects.

From a lawyer’s point of view, MIT is:

* simple, yes,

* but a bit vague on patents and attribution structure.

### 1.2 Apache-2.0: grown-up permissive

**Apache-2.0** is what happens when you ask:

> *“Can we make something like MIT, but safer for large companies?”*

Apache adds three major things:

1. **Explicit patent grant & retaliation**
   Each contributor grants you a **patent license** for patents practiced by the code. If you attack them with a patent lawsuit, you lose that license.

2. **Structured attribution (NOTICE)**
   A `NOTICE` file travels with the code. You preserve it and can add your own entries. It’s a consistent place to put credits and legal attributions.

3. **“Mark modified files”**
   If you change a file, you add a small note like `// Modified by <Your Company>, 2025.`

So you still get permissive reuse, but with:

* more clarity for patents,
* more predictable attribution,
* a cleaner audit trail.

If MIT is the **street graffiti** of open source, Apache is the **well-stamped engineering drawing**: same creative energy, but ready for the legal department.

---

## 2. Enter SSPL and BSL: Copyleft for the Cloud Era

MIT and Apache are **permissive**. They don’t require you to share your changes or your surrounding code.

But if you’re a **copyleft theorist** — someone who cares deeply about *reciprocity* — that’s not enough.

### 2.1 SSPL: AGPL++ for the cloud-native world

The **Server Side Public License (SSPL)** was introduced by MongoDB in 2018. Conceptually, it’s:

> **AGPL++ for the era of cloud-native managed services.**

Classic **GPL** says:

* If you link my GPL library into your program and distribute it, your program must be GPL too.

**AGPL** updated this for the web:

* If users access the program over a network, you must offer them the source code of that program.

**SSPL** takes it one level higher, to the **service**:

* If you offer SSPL-licensed software **as a service** to third parties, you must publish **the complete source code of the entire service stack** under SSPL:

  * the core program,
  * management tooling,
  * orchestration,
  * user-facing consoles,
  * backup scripts,
  * and so on.

In spirit, SSPL is saying:

> *“In the cloud-native world, the real unit of value isn’t a single binary or container. It’s the whole managed service. So copyleft should apply to that.”*

Whether you *like* SSPL or not, this is a very clean first-principles move. It’s copyleft aligned with **today’s economic reality**: managed services, not boxed software.

### 2.2 BSL: time-shifted economic copyleft

The **Business Source License (BSL / BUSL 1.1)** is a different answer to the same pressure.

Roughly, BSL says:

* You can **read** the source.
* You can **modify** it.
* You can **use it internally**.
* But you **can’t** use it for certain kinds of **production / competing** use **until a change date**.
* After that change date (say, 3–4 years), the code automatically becomes fully open source under a standard license (often GPL or Apache).

It’s like a **time-locked copyleft**. While the code is “fresh,” it’s more like proprietary source-available. When it’s “mature,” it joins the commons.

From a small vendor’s point of view, BSL is a way to say:

> *“We want the transparency and ecosystem benefits of sharing code, but we also need a period where hyperscalers can’t instantly undercut us.”*

If SSPL is a **hard boundary** around cloud services, BSL is a **time boundary** around commercial competition.

---

## 3. A Timeline of Copyleft: From One Box to the Cloud

If we zoom out, there’s a very clear evolution in what each license family declares as the **unit of reciprocity**:

* **GPL:** binary + linked libraries on a **single machine**.
* **AGPL:** the **networked application** — even if you never ship binaries.
* **SSPL:** the **entire managed service** around a critical component.
* **BSL:** the **commercial life window** where competition is restricted, followed by a delayed release into the true commons.

The pattern is:

> Each new license tries to follow the money.

* When value was in **shipped binaries** → GPL.
* When value shifted to **hosted apps** → AGPL.
* When value shifted further to **cloud-native managed services** → SSPL and BSL.

Which leads to the natural next question:

> **What happens when the real value is no longer in binaries, nor in services, but in the *prompts* that steer AI agents?**

---

## 4. AI-Native Era: When Prompts Become the Source Code

Karpathy’s line — *“The hottest new programming language is English”* — isn’t just a meme. It’s a license problem waiting to happen.

In an AI-native product today, the core logic often lives in:

* **System prompts** that define the agent’s role and behavior,
* **Tool descriptions** that serve as soft API contracts,
* **Routing prompts** that decide which tool or model to call,
* **Example dialogues** that teach style and tone.

If you strip away the UI, the logging, and the billing, many products are basically:

```text
Prompt Source  +  Generic LLM API  =  “Our AI product”
```

![Prompt Driven Product]({{ 'assets/2025/12-from-gpl-to-prompts/prompt-driven-product.webp' | relative_url }})

As a long-time open source person, I look at that and think:

> *“This is source code. Just not in C, Python, or Rust. It’s source code written in English.”*

And then I ask:

> **Where is the GPL for *this*?**

### 4.1 Why prompts matter more than ever

Prompts are not just configuration. In rich agents, prompts are:

* the **architecture** (“you are three sub-agents who debate and vote”),
* the **business logic** (“if the user mentions X, always ask Y before Z”),
* the **guardrails** (“never do A, B, C even if user insists”),
* the **UX contract** (tone, persona, level of detail).

If someone copies your prompts verbatim into their SaaS product, they’ve cloned the **soul** of your agent — the wizard’s spell, not just the staff.

So from a copyleft theorist’s perspective, prompts are exactly the thing we want to:

* **protect** as creative work, and
* **keep in a commons** when we choose to share them.

---

## 5. A Thought Experiment: Prompt Public Licenses (PPL)

I started asking myself:

> *“If English is the new source code, what would an open license for prompts look like?”*

What follows is **not legal advice** and **not a finished license**. It’s a design sketch, a conversation starter for the AI era.

I call it the **Prompt Public License (PPL)** and imagine at least four variants — loosely aligned with MIT, Apache-2.0, SSPL, and BSL.

### 5.1 Shared concept: what is “Prompt Source”?

First, we need to be clear what PPL actually covers.

> **Prompt Source** = the human-readable prompt text and examples used to steer an AI system, including:
>
> * system prompts,
> * tool / API descriptions,
> * routing / policy prompts,
> * example dialogues and few-shot examples,
> * agent graph definitions expressed in natural language.

We’re not trying to control *ideas* (“ask clarifying questions before answering”) — only the **concrete expression** (your actual wording, structure, and examples).

### 5.2 PPL-M: MIT for prompts

**PPL-M (MIT-style)** would be the easiest:

* You can do anything with the prompts:

  * use, modify, embed in closed SaaS,
  * sell products powered by them.
* Only requirement:

  * keep a simple attribution line and license text if you redistribute the **Prompt Source** itself.

This is for when you want **maximal adoption** and don’t care about reciprocity — the spiritual successor of MIT.

### 5.3 PPL-A: Apache for prompts

**PPL-A (Apache-style)** adds structure:

* Keep attribution and license text.
* If you modify prompts and redistribute them, you:

  * add a small “modified by / modified on” notice.
* No right is granted to use the author’s name/logos as endorsement.

Still permissive, but ready for grown-up governance and attribution — the “Apache of prompts.”

### 5.4 PPL-S: SSPL-style service copyleft for agents

This is the most interesting one.

**PPL-S (Service Copyleft)** says:

* You may:

  * use, modify, and run the prompts internally, no obligation to publish.
* If you **redistribute** the Prompt Source, you must:

  * keep the license and attribution,
  * license your modified Prompt Source under PPL-S.
* If you **offer an AI agent as a service** to third parties that uses these prompts (original or modified), you must provide those users with:

  * the **complete Prompt Source** used by that agent (system prompts, tool descriptions, routing prompts, etc.),
  * and any modifications you made,
  * all under PPL-S.

Secrets (API keys, passwords) can be redacted and replaced with placeholders, but the **logic** must be visible.

In other words:

> *“If you monetize this agent, you must show your prompts — and your improvements — to your users, under the same license.”*

This is the prompt-native version of AGPL/SSPL:

* GPL: *“Share your source when you ship binaries.”*
* AGPL: *“Share your source when you run it as a web app.”*
* SSPL: *“Share your whole service when you run it as a managed cloud product.”*
* **PPL-S:** *“Share your prompts when you run the agent as a service.”*

### 5.5 PPL-B: BSL-style, time-delayed openness for prompts

Finally, **PPL-B (Business Variant)** borrows from BSL:

* You can **read and modify** the prompts freely.
* You can **use them internally** and for demos.
* But before a **Change Date**, you **cannot**:

  * use them to run a paid service, or
  * offer a product that substantially competes with the author’s own prompt-based product,
  * unless you sign a commercial license.
* On the Change Date, the prompts automatically become licensed under a more open license (for example, PPL-M or PPL-S).

So PPL-B is for authors who want to:

* expose prompt logic early,
* invite collaboration and transparency,
* but keep a **commercial moat** for a few years before fully donating the prompts to the commons.

![Prompt Public Licenses]({{ 'assets/2025/12-from-gpl-to-prompts/ppl-family.webp' | relative_url }})

---

## 6. Why Bother? (And What Comes Next.)

You might ask:

> *“Do we really need licenses just for prompts?”*

I think the answer is **yes**, for the same reason we needed:

* GPL when everything was a static binary on a single box,
* AGPL when value moved to web apps,
* SSPL and BSL when value moved to cloud-native managed services.

In the **AI-native era**, a huge amount of value is now concentrated in:

* how we **orchestrate models**,
* how we **shape behavior through language**,
* how we **encode product strategy into prompts**.

If we believe in:

* **open collaboration**,
* **shared improvements**, and
* a **commons of powerful AI agents** rather than a few secretive black boxes,

then we need **legal tools** that understand that:

> **Natural language can be source code.**

Prompt Public Licenses are my first attempt at such tools — rough, drafty, and absolutely needing real legal review, but aligned with a simple principle:

> *When the value shifts, copyleft follows the value.*

---

## 7. Closing: An AI Adventist’s View

I sometimes describe myself as a kind of **AI Adventist**:

* I believe AI-native systems will be the default way we build and run software.
* I believe agents and prompts will be our new “operating system.”
* I believe the story of open source is not finished; it’s just moving to a new layer.

We went from:

* **One computer** → GPL,
* **Networked apps** → AGPL,
* **Cloud-native services** → SSPL & BSL.

Now we are entering:

* **AI-native agents** → ?

I don’t know what the final answer will be. But I suspect it will look a lot like:

* commons for **models** (at least some of them),
* commons for **data** (under some Train/ShareAlike ideas),
* and very importantly: commons for **agent prompts**.

That’s why I’m proposing this little family of **Prompt Public Licenses** — not as finished law, but as an invitation:

> **Further reading from my other experiments:**
>
> * **Vibe Coding Cloud Protocol** – unifying Azure resources into one “vibe tree” for billing and cognition: [https://wechaty.js.org/2025/11/29/vibe-coding-cloud-protocol/](https://wechaty.js.org/2025/11/29/vibe-coding-cloud-protocol/)
> * **MultiVerse Worktree (MVW)** – designing a multiverse Git workflow for AI co-founders and idea evolution (PreAngel post – link TBD)
>
> **If English is the new programming language, let’s make sure we build a healthy open-source culture around it, too.**

If you’re a lawyer, an open source maintainer, or an AI agent builder and this resonates with you, I’d love to hear your thoughts — or your pull requests on the PPL drafts.

The licenses of the future won’t be written by one person. They’ll be negotiated between humans, AIs, and the economic realities we all live in.

I just want to help us point them in the right direction.
