function [aeroForces] = paramSpace_6_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.504847)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.103420)*sailStates.p + (32.476784)*sailStates.q + (-1.323403)*sailStates.r + (0.011100)*sailStates.de;
	CD = -0.602370;
	CY = (-0.030975)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.528433)*sailStates.p + (-1.113122)*sailStates.q + (-0.036834)*sailStates.r + (-0.000238)*sailStates.de;

	Cl = (0.918723)*sailStates.alpha + (0.309190)*sailStates.beta + (-0.809398)*sailStates.p + (6.344225)*sailStates.q + (-1.211864)*sailStates.r + (-0.000299)*sailStates.de;
	Cm = (-13.287292)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.864326)*sailStates.p + (-123.764404)*sailStates.q + (4.527595)*sailStates.r + (-0.068848)*sailStates.de;
	Cn = (-0.507443)*sailStates.alpha + (0.021621)*sailStates.beta + (1.160822)*sailStates.p + (-4.211597)*sailStates.q + (-0.000108)*sailStates.r + (0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end