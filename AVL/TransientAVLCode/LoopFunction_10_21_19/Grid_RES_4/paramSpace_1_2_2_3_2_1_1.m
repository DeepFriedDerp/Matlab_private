function [aeroForces] = paramSpace_1_2_2_3_2_1_1(sailStates,airStates)

	CL = (4.154160)*sailStates.alpha + (-0.118908)*sailStates.beta + (-2.279061)*sailStates.p + (35.498672)*sailStates.q + (-1.550936)*sailStates.r + (0.010931)*sailStates.de;
	CD = -0.182980;
	CY = (0.030083)*sailStates.alpha + (-0.024762)*sailStates.beta + (-0.500984)*sailStates.p + (-0.194784)*sailStates.q + (-0.099645)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.190504)*sailStates.alpha + (0.225188)*sailStates.beta + (-0.988710)*sailStates.p + (8.739688)*sailStates.q + (-1.222843)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-12.598843)*sailStates.alpha + (0.450117)*sailStates.beta + (6.924935)*sailStates.p + (-127.822792)*sailStates.q + (5.175836)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (-0.196009)*sailStates.alpha + (0.051350)*sailStates.beta + (0.982053)*sailStates.p + (-3.687669)*sailStates.q + (-0.008824)*sailStates.r + (-0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end