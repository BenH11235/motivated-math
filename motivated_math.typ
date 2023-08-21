#let title = "Motivating Obtuse Math"
#let author = "Ben Herzog"

#set heading(numbering: "1.1")
#show link: underline

#set document(
    title: title,
    author: author
)


#set align(center)
#text(17pt, weight: "bold")[#title]

#text(10pt)[#author, #datetime.today().display()] 

#set align(left)

#outline()

= Introduction

For the average STEM undergraduate, one of the most memorable moments of their studies - and it is a true pity if that moment is missed - is the moment where linear algebra, as a field, "clicks". This happens by the fifth or sixth lecture, and once it happens, the material can never be seen in the same way again. All the strange terminology comes to life: determinants and dimensions, eigenvectors and eigenvalues, all have an intuitive meaning and can even be visualized by the mind's eye, if one is so inclined.

#figure(
  image("images/eigenvectors.png", width: 80%),
  caption: [
    Anatomy of a diagonalizable linear transform.  
  ],
) <eigenvalues>

Unfortunately, not all of mathematics lends itself to such "eureka moments" so easily. Of this, the eminent polymath Von Neumann famously said, "in mathematics, you don't understand things, you just get used to them". Some fields are generally legible, but contain some definitions that seem to come out of nowhere, and seem to be motivated solely by their use in proofs (of course, the student is left without an intuition of what exactly has been proven, either). Other fields are just infamous for their overall illegibility; Category Theory, for instance, has come to be known by the informal nickname "Abstract Nonsense". 

We are not here to discuss Category Theory, but rather, particular pieces of two more intuitive fields: Group Theory and Topology.  Of these two, Group Theory is closer to being an object of intuitive understanding, the way Linear Algebra is -- we will focus on one particular group-theoretic definition that baffles students. Topology is more notorious for being a wibbly-wobbly abstraction, and there we will tackle the seemingly out-of-nowhere way the field itself is axiomatized.


= Obtuse Group Theory: "Normal Subgroup"

Group theory is, informally speaking, the study of invertible operations. You can break an egg, but you cannot unbreak it; so, the set of possible operations in a group cannot permit egg-breaking, or any other action that similarly, once done, cannot be undone. More formally, a group $G$ is a set of elements (best thought of as "actions") with a binary operation $circle.small$ (best thought of as "composition" -- $a circle.small b$ meaning "do b then do a")#footnote[This isn't a typo. Think about how $f(g(x))$ means "apply g then apply f".] satisfying the following properties:


- *Closure:* if $a,b$ are in $G$ (written $a,b in G$) then $a circle.small b in G$. From now on we will write $a circle.small b$ as $a b$ for short.
- *Associativity:* for all $a,b,c in G$, we have $a(b c) = (a b)c$.
- *Identity:* There exists some $e in G$ such that for all $a in G$ we have $a e = e a = a$.
- *Inverse:* For every $a in G$ there exists some $b in G$ such that $a b = b a = e$.

#figure(
  image("images/group.png", width: 80%),
  caption: [
    Visualization of Rubik's Cube group, which contains 43,252,003,274,489,856,000 different elements.  
  ],
) <rubiks_cube>

This seems like a mouthful but really, "Inverse" is the only interesting load-bearing definition here. No one cares about mathematical structures that have no associativity (of course somewhere out there, there's a professor who has dedicated their entire adult life to studying these, and we apologize to them). Mathematical structures that have no closure property are an even more ridiculous notion. And "identity" is mainly there because it is necessary for defining what an inverse is.#footnote[To wit, a group without the inverse requirement is called a "semigroup", and these are traditionally defined without requiring the existence of an identity element.]

== Crash Course in Sub-Structures and Quotient Spaces

One of the most pedestrian concepts usually encountered when first learning about an algebraic structure is the definition of a "sub"-structure. For example, in Set Theory, the definition of a *subset* of some set $S$ is a set $T$ such that every element of $T$ is also in $S$ (denoted $T subset.eq S$); intuitively, it is a "smaller set contained in $S$". In the context of set theory it's enough for all the elements of $T$ to kind of exist and hang out, but if we're looking at an object with some more structure, then it makes sense to require that the "sub-object" be a structured object in itself. For example if $V$ is a vector space, it's not fruitful to look at some $W subset.eq V$ where $W$ has no structure. Instead we'd want $W$ to also be a vector space#footnote[There is a subtle point here where we require $W$ to inherit its behavior from $V$; of course it's meaningless to declare $W$ a subspace of $V$ by declaring new vector space behavior for it ad-hoc, on the spot.].

One interesting property of a "sub-structure" $T subset.eq S$ is that, in a lot of cases, you tend to get something called a "quotient space" from it (usually denoted $S / T$). This is done, broadly speaking, by considering elements of $S$ quote unquote "the same" -- equivalent in some sense -- if the difference between them can be expressed in terms of structure operations and elements of $T$. So, for example, in the case of two vector spaces $W subset.eq V$, you can get a new vector space $V / W$ by considering $v_1, v_2 in V$ the same if $v_2 - v_1 in W$.

Probably the simplest possible example of this is looking at plain old two-dimensional Euclidean Space -- you know, the one that has an x axis and a y axis, where all the exciting high school analytic geometry happens. This vector space is denoted $RR^2$, and every point in it can be written in coordinate form, as $(x,y)$. You already know how to perform addition in this space: point-wise, that is, $(x_1,y_1) + (x_2, y_2) = (x_1+x_2, y_1+y_2)$. Now, the x-axis $X$ (all points of the form $(x,0)$) is a subspace of $RR^2$. The proof of this requires some bookkeeping and diving into the precise exhausting definition of a vector space, so we will not write it down here, but hopefully you can see this intuitively; the key insight is that adding two points of $X$ will result in a point still in $X$. We now consider the space $RR^2 / X$ defined as above -- meaning two points $p_1, p_2$ of $RR^2$ are considered "the same" if $p_2 - p_1$ is in $X$. So, under this definition, $(1,3)$ and $(5,3)$ are "the same"; $(7,2)$ and $(199, 2)$ are also "the same". Every "set of points that are the same" is an element of $RR^2 / X$. A moment of thought will show you that we've partitioned $RR^2$ into horizontal lines, and these horizontal lines are the elements of $RR^2 / X$.#footnote[This is a good intuition for quotient spaces in general: each set that maps to the same element of the quotient space will have the shape of the subspace in the denominator.]

#figure(
  image("images/quotient.png", width: 40%),
  caption: [
    The space $RR^2$ shown as a product of $RR^1$ and the quotient space $RR^2 / RR^1$.  
  ],
) <quotient>

Now this is great and all but what we would really want to do is be able to perform algebraic operations on this $RR^2 / X$ creature so that we can declare it, too, a vector space, and announce triumphantly that we divided a vector space by another vector space and obtained a quotient vector space from this. But how do you add two horizontal lines and get a horizontal line? The standard way to get the algebraic operation we need for a quotient space is to naturally borrow it from the original space. This is a fancy way of saying that we do the laziest thing possible: "oh, adding two horizontal lines? OK, let's take a point from _this_ line and a point from _that_ line, and add those. What line did we end up on? OK, that's the addition result". All that's left is to show that this sleight-of-hand is well-defined, meaning, when we add two horizontal lines $L_1$ and $L_2$ this way, the line we end up on doesn't depend on the individual points we picked in $L_1$ and in $L_2$. This is in fact the case here (go ahead and check), and more generally with subspaces of vector spaces. 

A moment's thought will show that the resulting vector space $RR^2 / X$ behaves exactly like the y-axis, which we denote $Y$ (to see this, it helps to think of every horizontal line as equivalent to the point where it intersects the y-axis). This is written as $RR^2 / X \u{2245} Y$. Since both $X$ and $Y$ behave the same (vector-space-wise) as the real line $RR$, we can write: $RR^2 / RR \u{2245} RR$.

Understanding this simple example goes a very long way towards understanding quotient spaces in general.

== Quotient Spaces in Group Theory

After a few courses, the median math student is trained to expect this behavior. You learn about some structure. You learn that it can have sub-structures. You then learn one of exactly two things: either "space division" by a sub-structure isn't something that's routinely done at all, or there's a perfectly natural way to do it. Then comes group theory, where you can divide a group by its subgroup -- *sometimes*. The subgroup needs to be "pretty enough" with respect to the original group. Say what?

The student goes through the five stages of grief digesting this fact. That can't be right, can it? Surely if for two groups $H subset.eq G$ then it is possible to perform division and obtain $G / H$? They go through the motions: define two elements $g_1, g_2 in G$ to be equivalent if $g_2 / g_1 in H$. Obtain in this way a set $G / H$, and now all that's left is to apply the original group operation of $G$ and show that this application is well-defined, except the proof... doesn't... work...

The student is then introduced to the concept of a "normal subgroup". A subgroup $H$ of $G$ is said to be normal in $G$, denoted $H triangle.stroked.l.small G$, if any one of SEVEN equivalent conditions hold. We will give one of the tamer ones, and spare you the other six: "for all $g in G$, we have $g^(-1) H g = H$" (where $g^(-1) H g$ is interpreted in the obvious way: the set of all $g^(-1) h g$ that you get by picking all the $h in H$). Now, first we will see how this is not so obtuse and what it intuitively means, and then we will circle back and say with some dismay "wait, this is obtuse after all".

== Normal Subgroups Make Sense!

The construct $x^(-1) y x$ is universal across mathematics and implies "the action y, but from an x perspective". So, for example, if $g$ is "spin by 90 degrees clockwise" and h is "stretch the X-axis by a factor of 2",  $g^(-1) h g$ is "stretch the X-axis by a factor of 2, except you're looking at the space from a perspective where it's spun by 90 degrees clockwise". Try it out: spin, stretch, spin back. The Y-axis is stretched by a factor of 2 now instead of the X-axis, as if you've told someone to stretch the X-axis but they were looking at the space sideways. 

This is enough for us to continue already, but here's something very useful to notice: saying that $g^(-1) h g = h$ is the exact same as saying $g h = h g$, that is, $g$ and $h$ commute (just multiply both sides by $g$ from the left). This should explain some of the strange fixation that algebra has regarding operations that commute. "$A$ and $B$ commute" is another way to say that these two operations "respect each other" in some sense: $B$ is still $B$ even when done from $A$ perspective. For instance, stretching the X-axis by a factor of 2 does not "respect" turning by 90 degrees clockwise in this way (we just saw if you stretch from a spun perspective, you get a Y-axis stretch instead). But the action of stretching both the X-axis *and* the Y-axis by a factor of 2 *does* respect the spun perspective; that is, if $g$ is the spinning and $h$ is the stretching, then $g^(-1) h g = h$ (stop for a moment and convince yourself of this).

#figure(
  image("images/molecule.jpg", width: 40%),
  caption: [
    This molecule respects several "spin actions" that together form the molecule's symmetry group. This invariance under group action is not exactly the same concept as invariance under a perspective change, but it still provides a useful intuition. 
  ],
) <molecule>

So, let's look again at the requirement for $H triangle.stroked.l.small G$ -- that is, $g^(-1) H g = H$ for all $g in G$. This is a weaker condition than requiring that $H$ and $G$ outright commute. An action in $H$ looked at from a different $G$-perspective doesn't need to be the exact same action, but it must still be at least an action in $H$ and not outside of it. This seems to be some kind of statement about $H$ being "complete", in some sense, with respect to "changes in perspective" allowed by $G$. So, for example, if we take $G$ to be the group of all invertible linear operations in $RR^2$, and $H$ to be all invertible stretches along the X-axis (stop and convince yourself this is a subgroup of $G$), then $H$ cannot be normal in $G$ because, as we've just seen, its operations don't respect the "spin by 90 degrees" change in perspective that $G$ contains. So, great! We now understand what a normal subgroup of $G$ is: it is a subgroup that's "complete $G$-symmetry-perspective-wise". 

== No, Wait, They Don't

Unfortunately, if you'll recall, we started out this entire discussion by noting that $H triangle.stroked.l.small G$ is the exact condition required so that $G / H$ can have group structure. And _that's_ where the true obtuseness comes into play. Because, _why?_ Why should the set $G / H$ only admit group structure if H respects G's symmetries? Some students just memorize this fact without trying to make sense of it, and would maybe even answer "I don't see the issue", because that's how they've learned to deal with mathematics all their lives; if that's you, go read #link("https://enlightenedidiot.net/random/feynman-on-brazilian-education-system/")[Feynman's 1985 rant on the education system in Brazil], we can't recommend it enough.

Assuming you do see there is something to be explained here, you might turn to the official curriculum and look at the proof that allows imposing a group structure on $G / H$ if $H triangle.stroked.l.small G$. It goes like this -- watch closely! -- the "it doesn't matter what point you pick to represent each line, you end up with the same line" condition we've spoken about before can be written in group-theoretic language as $H a H b = H a b$. So we note that the normal subgroup definition can also be stated as $H a = a H$ for all $a in G$ (you literally get this by taking the original condition, $a^(-1) H a = H$, and multiplying both sides by $a$ from the left). So we can say $H a H b = a H H b$, and obviously $H H = H$ (multiplying any two elements of $H$ results in an element of $H$ - that's just the definition of a group) so we can continue to write $= a H b = H a b$ (using $a H = H a$ again) and QED. Ta-da! 

This proof belongs in the distinguished club of "sleight of hand proofs": you cannot point out the error; in an instant the magic trick is done, the rabbit is out of the hat, you've lost your wristwatch and you have no idea what just happened. Having read the proof, you have no idea _why_ the quotient space of a normal subgroup can be endowed with group structure, only that this appears to be true. 

We've properly reached the "obtuse math" moment: it's clear why normal subgroups were technically defined this way, because with a "vanilla" subgroup the proof just doesn't work, and using this altered definition, it does. But _why_ does this happen? How does this make sense? Because $H$ being "complete with respect to the symmetry of $G$" allows us to move some letters around in an equation? Really?

There are, broadly speaking, two ways out of this bind.

== Solution 1: Overclock Your Mind

Consider the example we've seen earlier: $H subset.eq G$, $G$ contains all invertible linear operations in $RR^2$ (that is, all matrices $mat(a,b; c,d)$ with $a d-c b eq.not 0$) and $H$ contains all invertible stretches along the X-axis (that is, all matrices of the form $mat(c,0; 0, 1;)$ with $c eq.not 0$). 

#figure(
  image("images/stretched-display.jpg", width: 80%),
  caption: [
    This TV screen has been operated upon by an action which is a member of H; a stretching action in the X-axis direction. 
  ],
) <stretch>

Investigating the structure of $G / H$, one can find with relative ease a way to violate the "if two points are the same, multiplications involving them will also turn out the same" requirement for a group structure on this quotient space. e.g. setting $g_1 = mat(0, -1; 3, 0;), g_2 = mat(0, -1; 7, 0;), g_3 = mat(0, -1; 1, 0;)$, we have that $g_1$ and $g_2$ are "the same" in the quotient space, but $g_1 g_3$ and $g_2 g_3$ are not. You can check the computation: $g_2^(-1) g_1 = mat(0, 1/7; -1, 0) mat(0, -1; 3, 0) = mat(3/7, 0; 0, 1) in H$; but $(g_1 g_3)^(-1) (g_2 g_3) = mat(1, 0; 0, 7/3) in.not H$.

What's going on here? $g_1$ and $g_2$ both rotate 90 degrees counterclockwise then stretch the Y-axis; $g_3$ just rotates 90 degrees counterclockwise. $g_1 g_3$ and $g_2 g_3$ are both 180-degree turns followed by a Y-axis stretch. Imagine the image of an apple squarely on the center of $RR^2$; Discounting the apple's orientation, $g_1$ and $g_2$ both modify the width of the apple, whereas $g_1 g_3$ and $g_2 g_3$ modify its height. So these two latter operations are no longer "the same" with respect to $H$ because no operation in $H$ will ever be able to make the apple taller or shorter, only wider or thinner. Thinking about this turn of events carefully, it is maybe possible to catch an inkling of how this deficiency of $H$ -- where it no longer contained its own action when performed from a quarter-turn perspective -- implied the failure of our attempt to impose a multiplicative structure on $G / H$. Focusing intently, steam coming out the ears, you can _see_ the fundamental idea at play here... almost...


== Solution 2: Wake Up, Neo

We have some alarming news to deliver: "Substructures" as defined above were a mistake. 

Yes, a smaller spaces can technically exist inside a larger space, but the moment quotient spaces enter the discussion, these simple smaller spaces are not relevant. Looking at a smaller vector space inside a vector space and saying "hurray, we have a subspace!", and deriving quotients based on the existence of the smaller space alone -- that was a misguided notion from the start. It only ever worked because of a lucky coincidence. In Group Theory we no longer have this lucky coincidence, and that's the source of our confusion.

How so? Well, think of some structured space X and a quotient space Q. The way quotient spaces work, there is naturally a function $phi$ that assigns to each $x in X$ its corresponding "set-of-elements-the-same-as-$x$" in $Q$. A moment's thought will show that "we need $Q$ to have structure" is exactly equivalent to "we need $phi$ to respect the structure operations". So for example, in linear algebra, we need $phi$ to satisfy $phi(v_1+v_2) = phi(v_1)+phi(v_2)$. In group theory we need $phi(g_1 g_2) = phi(g_1) phi(g_2)$. A $phi$ like this that respects structure properties is called a *homomorphism*.

So, in the case of Group Theory and a subgroup $H$, let's say we want to construct a quotient space $G / H$. Consider any $g_1, g_2 in G$ and $h in H$. We say that $g_1$ and $g_2$ are mapped to the same element of quotient space (this is what we earlier called 'are the same') if $g_1 g_2^(-1) in H$. Choosing $g_2 = e$ we immediately obtain that $phi(x) = phi(e)$ if and only if $x in H$. That is, from the most basic definitions, it follows that $H$ must be exactly the set that $phi$ maps to the identity of the quotient space. 

#figure(
  image("images/kernel.png", width: 80%),
  caption: [
    A rare picture of a homomorphism and its kernel in their natural habitat (2004, colorized). 
  ],
) <homomorphism>

The set of elements that a homomorphism maps to the identity (in this case $phi(e)$) is called the "kernel" of the homomorphism. So, what we've just concluded above is that for the quotient space $G / H$ to have group structure, $H$ must be exactly equal to the kernel of the homomorphism $phi$. Now that we've decided that, _of course_ if we look at some $g^(-1) h g$ then we have $phi(g^(-1) h g) = phi(g^(-1)) phi(h) phi(g) = phi(g^(-1)) e phi(g) = phi(g^(-1)) phi(g) = phi(g^(-1) g) = phi(e)$ implying $g^(-1) h g in H$. Or, alternatively, in English: from the homomorphism's perspective, respecting the group structure directly implies that if a group element $h$ is mapped to $e$, all the "reflections" that are $h$ seen "from a different perspective given by $G$" must also be mapped to $e$ (we have explained before that's what $g^(-1) h g$ means). Therefore, this mysterious property where a normal subgroup has to be "complete with respect to the symmetry of $G$" can be better understood as the property of being able to function as the kernel of a homomorphism without exploding.

In conclusion, spaces embedded inside other spaces are cute, but kernels of homomorphisms are where the action actually happens, and they are the reason that structured quotient spaces come into being. An exactly analogous argument can be made for vector spaces: to enable a structured quotient space, a vector subspace must be the kernel of the homomorphism $phi$ to the quotient space. It's just that with vector spaces it so happens that _every_ small space embedded in a larger space admits such a homomorphism; whereas with Group Theory, a group $G$ can have embedded inside it a smaller 'deficient' group $H$ that can't function as a homomorphism kernel because it lacks some of the needed G-perspective reflections. #footnote[What if you forcibly add all the missing $g^(-1) h g$s to such a deficient $H$? Great! That's called the "normal closure" of $H$, and it is indeed guaranteed to be a normal subgroup. Though note that maybe you get the whole of $G$ this way; a naughty $H$ that will give you such a result is called "contranormal".]

To put it tersely, the answer to "why can't I divide by my subgroup?" is "no one cares about your god damned subgroup".


= Obtuse Topology: "Open Set"

Topology is the mathematical study of dough. It studies the properties of objects and spaces that are still relevant, assuming the entire universe is made of dough -- infinitely-expanding, infinitely-shrinkable, infinitely-malleable dough. You are not allowed to rip up the dough; only to knead it, gently. If you know one thing about topology, it's probably that joke about the Topologist who tried to dunk his coffee cup inside a donut instead of the other way around, because he could not tell the difference between those two objects.

#figure(
  image("images/topology.png", width: 80%),
  caption: [
    This image speaks for itself.  
  ],
) <donut>

Some questions that are relevant in the world of dough are: "Can I get from point A to point B on this dough?" (connectedness), "how close to 'normal' is the way points on this dough relate to each other?" (separation T-hierarchy), "does this dough have well-defined boundaries?" (compactness).

This seems like it should be a pretty straightforward subject of study. Unfortunately, the first stumbling block to properly understanding Topology appears right in the very first definition one encounters when studying the subject -- the definition of what a "topological space" is in the first place. For this definition you'll need to recall that $2^X$ signifies "the set of all possible subsets of $X$".

A topological space is a tuple $X, O subset.eq 2^X$ satisfying the following properties:
- $X in O$ and $emptyset in O$.
- If $S_1, S_2 in O$ then $S_1 sect S_2 in O$.
- If $cal(F) subset.eq 2^O$ then $(attach(limits(union), b: S in cal(F)) S) in O$. 

The sets in $O$ are called the space's "open sets". What this means in English is that the full set $X$ and the empty set should be open; the intersection of two open sets should be open; and a union of _any collection_ of open sets should be open. That is literally it -- the three axioms of a topological space. What does this have to do with "dough-nature" and the actual material one works with when doing Topology? Why arbitrary unions and pair-wise intersections, and not vice-versa? What tangible concept does an "open set" represent, anyway? Those are all very good questions, often asked by newcomers, and often answered by all sorts of philosophical constructions (see for instance #link("https://mathoverflow.net/questions/19152/why-is-a-topology-made-up-of-open-sets")[this truly astounding list of responses on mathoverflow], which includes, for instance, the sentence: 'Computationally an observable property $P$ of a data type $A$ corresponds to a semi-decision procedure'...)

Now, make no mistake; the relevant pieces of theory, and most importantly continuity, are all successfully stated in terms of these inscrutable "open sets". But this has the aura of dark magic, and immediately demotivates students from trying to properly understand anything that happens from that point forward.

== What is an Open Set, Anyway?

A student's first encounter with the term "open set" is usually in a Calculus I course. There, open sets are defined in that course's universally beloved $epsilon - delta$ language; a set $S$ is said to be "open" if for every point $p in S$, there exists some $epsilon> 0$ such that the "ball" ${x: |x-p| < epsilon}$ is entirely contained in $S$. Alternatively, every sequence that converges to some point inside $S$ must, from some index forward, be in $S$. These two possible definitions are equivalent, and they intuitively mean that $S$ "only has an inside and no outside". And note the stark difference; here "open" is defined in terms of other concepts, whereas in the above axiomatization of topology, "open" is the most basic term, based on which all other topological concepts are defined.

#figure(
  image("images/openset.jpg", width: 40%),
  caption: [
    The inside of this piece of dough is an open set, but the whole piece of dough including the boundary is not open. No matter how small the circle is surrounding that lower dot, some part of it will still be outside the dough. 
  ],
) <openset>

A sane student with a healthy connection to reality #footnote[Feel free to read that as "a Physics major".] will mostly care about what the open sets _are_, and not what philosophical process led to deciding which sets are open, and at least there is usually no confusion with regards to that. In a reasonable space like $RR^3$, either the open sets are obtained from the calculus definition, or they are declared by fiat -- using the Topology definition -- to be exactly equal to the open sets as obtained from the calculus definition. But this still doesn't answer the question of what these "open sets" have to do with the methodological study of dough properties.

== A Perspective Shift: Convergence as a Window to Topology

Instead, let's look at two concepts that do have an immediate and obvious relation to topological properties: convergence and continuity.

The importance of continuity as a topological concept can really not be overstated. An oft-quoted folk saying goes, "the raison d'être of topological spaces is that continuous functions live on them". The above axiomatization of topology defines continuity, as everything else, in terms of open sets;#footnote[If you have to know: a function $f: X arrow.r Y$ is called "continuous" if $S$ being open implies that $f^(-1)(S)$ is open.] but the more newbie-friendly definition of "continuous function" is (again) encountered in Calculus I. There, a function $f$ is called "continuous" if for every sequence of points $(x_1, x_2, x_3, dots)$ that converges to $L$, we have that the sequence $(f(x_1), f(x_2), f(x_3), dots)$ converges to $f(L)$.#footnote[this is a definition due to Cauchy.]

It is much clearer what convergence and continuity have to do with Topology than what open sets, per se, have to do with it. For example, instead of saying "a space $X$ is connected", you can alternately say "$X$ has no subset $S$ where the property of being inside or outside $S$ respects convergence" (meaning, such an $S$ where sequences inside $S$ can only converge inside $S$, and sequences outside $S$ can only converge outside $S$).

So, one path to a proper motivation of open sets is to flip the problem on its head and forget the axiomatization of Topology using Open Sets. Instead, one can think of what would happen if we tried to axiomatize Topology in terms of convergence#footnote[This is distinct from the concept of "convergence space", which is a different mathematical cocnept.]. The beauty of it is that the moment of enlightenment arrives without even completing the axiomatization properly. 

#figure(
  image("images/continuous.png", width: 40%),
  caption: [
    You know what a continuous function looks like, but they're just so pleasing to look at, we couldn't resist including an image. 
  ],
) <continuous>


Let's explain what we mean by that. Suppose we tried to create an axiomatization of this sort. It would go something like: "A topological space is a set $X$ endowed with a 'convergence map' $f: X^(NN) arrow.r 2^X$ (that is, $f$ maps a sequence of points in $X$ to a subset of $X$, which can be understood to be "the points in $X$ that the sequence successfully converges to"). $f$ has the following properties: first we'd probably want to make sure the axioms force $f(x, x, x, dots)$ to converge to exactly ${x}$, and then...

But wait -- in this axiomatization, how would we define "open set" in terms of convergence? In all probability, some form of the definition in Calculus I that we discussed earlier, and does exactly that. We would say something like: "A set $S$ is open if every sequence that converges to some $T$ that intersects $S$ must, from some index forward, be in $S$"#footnote[Maybe this would be easier to parse if we defined the output of $f$ to be a single point, but actually in topological spaces it is possible for a sequence to converge to many points, and even in the most vanilla form of calculus you have sequences that converge nowhere; this is what motivates this specific formulation with a set of converged-to points, that can also be empty.]. Now, watch as we _automatically_ and _magically_ get every single "open set axiom" as a logical result of this definition:

- Of course the empty set $emptyset$ is open. "Every sequence that converges to some set T that intersects $emptyset$ must satisfy..." no need to read further. There is no such set, and therefore no such sequence!#footnote[See: #link("https://en.wikipedia.org/wiki/Vacuous_truth")[vacuous truth] if you find this confusing.]
- Of course the whole space $X$ is open. "Every sequence that... blah blah blah... must from some point forward be contained in the whole space $X$". There is no way for it not to be.
- Of course if $S_1$ and $S_2$ are open, so is $S_1 sect S_2$. Suppose a sequence converges to $T$, which intersects $S_1 sect S_2$. Obviously it individually intersects $S_1$ as well as $S_2$, so, since $S_1$ is open, the sequence will eventually be in $S_1$; and the same logic applies for $S_2$. Past those two "eventually" points, it will be in both $S_1$ and $S_2$, and therefore in $S_1 sect S_2$.
- Of course if a huge bunch of sets are open, their union is also open. Suppose a sequence intersects this union; then it must intersect at least one set $S$ in the union. Since $S$ is open, the sequence will eventually be in $S$, and therefore in the union.
- And what about arbitrary intersections? In the open set axioms, open sets are not closed under arbitrary intersections; do we get the same effect here? Yes: Suppose you have the intersection of a huge bunch of open sets. Suppose a sequence intersects this intersection. So for each $S$ in the intersection there exists some number $N_S$ where from that point on the sequence is in $S$. But there is no guarantee that this infinite collection of numbers has an upper bound. For every _individual_ $N_S$ the sequence index is guaranteed to eventually exceed it, but it might well be that the $N_S$ values just go on and on without bound, and there is no sequence index greater than all of them.

So, we've made clear that at least one sane axiomatization of topology is going to involve these "open sets", and that they are naturally going to have the exact properties that the original axiomatization ascribes to them, purely by virtue of the way they interact with the concept of convergence. Now, all that's left is to realize that once an object emerges in a mathematical system, there is no law against trying to axiomatize the entire system based on that object and its properties. Maybe if you actually succeed, this results in an axiom system that is very unintuitive as an introduction to the field; but, perhaps unfortunately, the math police will not come get you and prevent your creation from seeing the light of day. This is exactly what happened here. Someone happened upon the "open set axiomatization" of topology, and was enamored with its minimalism and elegance. One thing led to another, and the system endures to this day, baffling generation after generation of students to no end#footnote[that mathoverflow page we linked to earlier is just a drop in the ocean; the web is veritably full of confused people asking what's up with the topology axioms.]. 

To put it tersely, the answer to "what's up with these Topological space axioms?" is "they're just some cute properties of your Calculus I open sets; turned out they could reconstruct all of topology out of these". 

= Conclusion

Mathematics is notoriously full of strange definitions and inscrutable theorems that do not seem to be motivated in any coherent way. We hope you've enjoyed this text, or at least tolerated it; and that he concepts of "normal subgroup" and "open set", both awkward enough that the internet is full of confused students asking for an explanation or a motivation for these concepts, are clearer and more well-motivated now than they were before. Happy math-ing, and remember, math is not a spectator sport! Go work on some group theory and topology exercises!
