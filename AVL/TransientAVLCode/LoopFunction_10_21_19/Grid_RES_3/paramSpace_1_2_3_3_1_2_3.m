function [aeroForces] = paramSpace_1_2_3_3_1_2_3(sailStates,airStates)

	CL = (3.887644)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.769545)*sailStates.p + (37.242237)*sailStates.q + (-0.832047)*sailStates.r + (0.010986)*sailStates.de;
	CD = 0.062790;
	CY = (-0.054275)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.127970)*sailStates.p + (-0.318252)*sailStates.q + (-0.022595)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.274554)*sailStates.alpha + (0.076683)*sailStates.beta + (-1.390567)*sailStates.p + (11.842237)*sailStates.q + (-0.542572)*sailStates.r + (0.000702)*sailStates.de;
	Cm = (-14.060208)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.301850)*sailStates.p + (-143.204193)*sailStates.q + (2.783320)*sailStates.r + (-0.069165)*sailStates.de;
	Cn = (0.242995)*sailStates.alpha + (0.013521)*sailStates.beta + (0.100973)*sailStates.p + (0.475354)*sailStates.q + (-0.034821)*sailStates.r + (0.000060)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end