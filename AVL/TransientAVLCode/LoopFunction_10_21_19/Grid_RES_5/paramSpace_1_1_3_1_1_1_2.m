function [aeroForces] = paramSpace_1_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.239194)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.065939)*sailStates.p + (45.178337)*sailStates.q + (-2.526223)*sailStates.r + (0.011846)*sailStates.de;
	CD = -0.596860;
	CY = (-0.242706)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.779014)*sailStates.p + (-0.476207)*sailStates.q + (-0.194247)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.232992)*sailStates.alpha + (0.408225)*sailStates.beta + (-1.592328)*sailStates.p + (15.320884)*sailStates.q + (-2.035200)*sailStates.r + (0.001050)*sailStates.de;
	Cm = (-10.352098)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.698507)*sailStates.p + (-148.858078)*sailStates.q + (8.314802)*sailStates.r + (-0.067973)*sailStates.de;
	Cn = (0.832593)*sailStates.alpha + (0.101782)*sailStates.beta + (1.464633)*sailStates.p + (-4.781199)*sailStates.q + (-0.043264)*sailStates.r + (-0.000019)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end