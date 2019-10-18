function [aeroForces] = paramSpace_2_1_2_1_2_1_1(sailStates,airStates)

	CL = (6.149618)*sailStates.alpha + (-2.083108)*sailStates.beta + (-3.740493)*sailStates.p + (51.493454)*sailStates.q + (2.408767)*sailStates.r + (0.012850)*sailStates.de;
	CD = -6.467480;
	CY = (2.031595)*sailStates.alpha + (-0.135736)*sailStates.beta + (0.379329)*sailStates.p + (15.638226)*sailStates.q + (-0.042186)*sailStates.r + (0.003314)*sailStates.de;

	Cl = (-5.545028)*sailStates.alpha + (-1.115063)*sailStates.beta + (-1.905552)*sailStates.p + (16.594311)*sailStates.q + (2.626189)*sailStates.r + (0.001672)*sailStates.de;
	Cm = (4.566672)*sailStates.alpha + (9.296400)*sailStates.beta + (11.623308)*sailStates.p + (-165.849884)*sailStates.q + (-8.486602)*sailStates.r + (-0.068399)*sailStates.de;
	Cn = (-2.358276)*sailStates.alpha + (0.230787)*sailStates.beta + (-1.043559)*sailStates.p + (-8.339581)*sailStates.q + (-0.194222)*sailStates.r + (-0.004314)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end