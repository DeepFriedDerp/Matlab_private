function [aeroForces] = paramSpace_15_1_1_2_2_1_2(sailStates,airStates)

	CL = (3.833744)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.597328)*sailStates.p + (34.729465)*sailStates.q + (0.657957)*sailStates.r + (0.010210)*sailStates.de;
	CD = -0.015130;
	CY = (0.021582)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.027156)*sailStates.p + (0.199285)*sailStates.q + (0.006749)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.242791)*sailStates.alpha + (0.005743)*sailStates.beta + (-1.296765)*sailStates.p + (10.966282)*sailStates.q + (0.296871)*sailStates.r + (0.000628)*sailStates.de;
	Cm = (-14.333106)*sailStates.alpha + (0.000000)*sailStates.beta + (9.089768)*sailStates.p + (-139.959488)*sailStates.q + (-2.245259)*sailStates.r + (-0.067023)*sailStates.de;
	Cn = (-0.285003)*sailStates.alpha + (-0.001432)*sailStates.beta + (0.321679)*sailStates.p + (-2.558511)*sailStates.q + (-0.073905)*sailStates.r + (-0.000061)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end