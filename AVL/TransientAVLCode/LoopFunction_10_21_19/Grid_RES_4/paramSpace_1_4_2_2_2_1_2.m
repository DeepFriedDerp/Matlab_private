function [aeroForces] = paramSpace_1_4_2_2_2_1_2(sailStates,airStates)

	CL = (4.449085)*sailStates.alpha + (0.452053)*sailStates.beta + (-2.538110)*sailStates.p + (38.640022)*sailStates.q + (-2.005923)*sailStates.r + (0.011139)*sailStates.de;
	CD = -0.489350;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.695860)*sailStates.p + (0.000000)*sailStates.q + (-0.138415)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.313784)*sailStates.alpha + (0.473245)*sailStates.beta + (-1.131293)*sailStates.p + (10.189666)*sailStates.q + (-1.622927)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-12.012014)*sailStates.alpha + (-1.708361)*sailStates.beta + (7.435744)*sailStates.p + (-133.820877)*sailStates.q + (6.675129)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.087222)*sailStates.alpha + (0.066727)*sailStates.beta + (1.392720)*sailStates.p + (-5.580817)*sailStates.q + (-0.001073)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end