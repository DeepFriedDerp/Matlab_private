function [aeroForces] = paramSpace_1_2_3_3_2_2_1(sailStates,airStates)

	CL = (3.948491)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.250587)*sailStates.p + (33.054409)*sailStates.q + (-0.779622)*sailStates.r + (0.010734)*sailStates.de;
	CD = 0.046880;
	CY = (-0.005126)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.151278)*sailStates.p + (-0.173374)*sailStates.q + (-0.026691)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.083879)*sailStates.alpha + (0.082556)*sailStates.beta + (-0.967714)*sailStates.p + (7.905828)*sailStates.q + (-0.499618)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-14.139980)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.503975)*sailStates.p + (-128.476028)*sailStates.q + (2.602615)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (0.031819)*sailStates.alpha + (0.014557)*sailStates.beta + (0.223859)*sailStates.p + (-0.548363)*sailStates.q + (-0.018741)*sailStates.r + (0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end