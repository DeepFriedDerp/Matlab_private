function [aeroForces] = paramSpace_4_1_1_2_1_1_1(sailStates,airStates)

	CL = (4.009279)*sailStates.alpha + (-0.058048)*sailStates.beta + (-1.975195)*sailStates.p + (28.161362)*sailStates.q + (-0.017782)*sailStates.r + (0.009714)*sailStates.de;
	CD = -0.270640;
	CY = (-0.019387)*sailStates.alpha + (-0.026093)*sailStates.beta + (-0.197702)*sailStates.p + (-0.455226)*sailStates.q + (0.039374)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.005355)*sailStates.alpha + (0.111971)*sailStates.beta + (-0.845571)*sailStates.p + (6.447541)*sailStates.q + (-0.270150)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-14.791454)*sailStates.alpha + (0.351094)*sailStates.beta + (7.281127)*sailStates.p + (-121.885399)*sailStates.q + (0.032656)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.324409)*sailStates.alpha + (-0.027317)*sailStates.beta + (0.584825)*sailStates.p + (-2.598820)*sailStates.q + (-0.029541)*sailStates.r + (0.000090)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end