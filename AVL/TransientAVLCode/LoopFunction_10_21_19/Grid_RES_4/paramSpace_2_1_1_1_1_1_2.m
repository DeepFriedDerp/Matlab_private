function [aeroForces] = paramSpace_2_1_1_1_1_1_2(sailStates,airStates)

	CL = (5.547910)*sailStates.alpha + (-0.558324)*sailStates.beta + (-2.621774)*sailStates.p + (37.293255)*sailStates.q + (-2.123861)*sailStates.r + (0.011363)*sailStates.de;
	CD = -1.841140;
	CY = (-0.219562)*sailStates.alpha + (-0.022443)*sailStates.beta + (-0.873540)*sailStates.p + (-1.693498)*sailStates.q + (-0.057076)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.209457)*sailStates.alpha + (0.361515)*sailStates.beta + (-1.276458)*sailStates.p + (10.990032)*sailStates.q + (-1.983566)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-12.233199)*sailStates.alpha + (2.278680)*sailStates.beta + (8.385766)*sailStates.p + (-136.946671)*sailStates.q + (7.252676)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.034439)*sailStates.alpha + (0.032819)*sailStates.beta + (1.926204)*sailStates.p + (-7.117216)*sailStates.q + (0.001091)*sailStates.r + (0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end