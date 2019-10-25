function [aeroForces] = paramSpace_15_1_3_2_1_1_2(sailStates,airStates)

	CL = (3.739259)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.566623)*sailStates.p + (35.011894)*sailStates.q + (0.876581)*sailStates.r + (0.009989)*sailStates.de;
	CD = 0.056020;
	CY = (-0.062438)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.126420)*sailStates.p + (-0.596614)*sailStates.q + (-0.031542)*sailStates.r + (-0.000126)*sailStates.de;

	Cl = (1.246757)*sailStates.alpha + (-0.039765)*sailStates.beta + (-1.277912)*sailStates.p + (11.023150)*sailStates.q + (0.509459)*sailStates.r + (0.000561)*sailStates.de;
	Cm = (-13.737768)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.726862)*sailStates.p + (-138.535995)*sailStates.q + (-2.980916)*sailStates.r + (-0.066877)*sailStates.de;
	Cn = (-0.196368)*sailStates.alpha + (0.009914)*sailStates.beta + (0.009926)*sailStates.p + (-0.710689)*sailStates.q + (-0.050043)*sailStates.r + (0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end