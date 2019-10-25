function [aeroForces] = paramSpace_12_1_4_2_2_2_2(sailStates,airStates)

	CL = (4.035369)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.778229)*sailStates.p + (38.259224)*sailStates.q + (1.215669)*sailStates.r + (0.011164)*sailStates.de;
	CD = -0.072650;
	CY = (0.072674)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.387003)*sailStates.p + (0.291854)*sailStates.q + (-0.054359)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.299046)*sailStates.alpha + (-0.205206)*sailStates.beta + (-1.375698)*sailStates.p + (11.823784)*sailStates.q + (0.987442)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-13.372924)*sailStates.alpha + (0.000000)*sailStates.beta + (9.030522)*sailStates.p + (-142.523422)*sailStates.q + (-4.126162)*sailStates.r + (-0.069778)*sailStates.de;
	Cn = (-0.208118)*sailStates.alpha + (0.028840)*sailStates.beta + (-0.698411)*sailStates.p + (2.189364)*sailStates.q + (-0.013793)*sailStates.r + (-0.000039)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end