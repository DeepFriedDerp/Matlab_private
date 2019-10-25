function [aeroForces] = paramSpace_4_4_2_1_2_3_2(sailStates,airStates)

	CL = (6.481556)*sailStates.alpha + (-0.716324)*sailStates.beta + (-2.631640)*sailStates.p + (42.921562)*sailStates.q + (3.226626)*sailStates.r + (0.012076)*sailStates.de;
	CD = -2.384790;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (1.244840)*sailStates.p + (0.000001)*sailStates.q + (-0.247614)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.878299)*sailStates.alpha + (-0.824959)*sailStates.beta + (-1.160984)*sailStates.p + (11.330608)*sailStates.q + (2.739689)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-10.563216)*sailStates.alpha + (2.667266)*sailStates.beta + (6.641595)*sailStates.p + (-133.820877)*sailStates.q + (-10.667583)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.232244)*sailStates.alpha + (0.115436)*sailStates.beta + (-2.652835)*sailStates.p + (11.316723)*sailStates.q + (0.028658)*sailStates.r + (0.000225)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end