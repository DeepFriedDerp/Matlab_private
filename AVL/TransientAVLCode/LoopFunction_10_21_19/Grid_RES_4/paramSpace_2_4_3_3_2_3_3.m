function [aeroForces] = paramSpace_2_4_3_3_2_3_3(sailStates,airStates)

	CL = (4.130929)*sailStates.alpha + (-0.089082)*sailStates.beta + (-2.790468)*sailStates.p + (36.022133)*sailStates.q + (0.291902)*sailStates.r + (0.010859)*sailStates.de;
	CD = -0.151490;
	CY = (0.032847)*sailStates.alpha + (-0.024723)*sailStates.beta + (0.230200)*sailStates.p + (0.065299)*sailStates.q + (0.015090)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.294657)*sailStates.alpha + (-0.135789)*sailStates.beta + (-1.357258)*sailStates.p + (10.873985)*sailStates.q + (0.370847)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.653869)*sailStates.alpha + (0.398714)*sailStates.beta + (9.705424)*sailStates.p + (-143.297119)*sailStates.q + (-1.001996)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.062585)*sailStates.alpha + (-0.006314)*sailStates.beta + (-0.591416)*sailStates.p + (2.863754)*sailStates.q + (-0.008671)*sailStates.r + (0.000026)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end