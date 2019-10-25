function [aeroForces] = paramSpace_9_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.459714)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.066103)*sailStates.p + (38.300461)*sailStates.q + (-0.824227)*sailStates.r + (0.011214)*sailStates.de;
	CD = -0.569740;
	CY = (-0.217736)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.419299)*sailStates.p + (-1.046667)*sailStates.q + (0.014753)*sailStates.r + (-0.000228)*sailStates.de;

	Cl = (1.370756)*sailStates.alpha + (0.252021)*sailStates.beta + (-1.622557)*sailStates.p + (13.444258)*sailStates.q + (-0.874773)*sailStates.r + (0.001016)*sailStates.de;
	Cm = (-14.361396)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.627021)*sailStates.p + (-151.326889)*sailStates.q + (2.852530)*sailStates.r + (-0.071886)*sailStates.de;
	Cn = (0.308419)*sailStates.alpha + (-0.008801)*sailStates.beta + (1.006864)*sailStates.p + (-3.867743)*sailStates.q + (-0.003139)*sailStates.r + (0.000230)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end