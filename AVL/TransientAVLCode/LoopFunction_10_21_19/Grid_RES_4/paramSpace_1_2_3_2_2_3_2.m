function [aeroForces] = paramSpace_1_2_3_2_2_3_2(sailStates,airStates)

	CL = (4.183360)*sailStates.alpha + (0.013966)*sailStates.beta + (-2.403299)*sailStates.p + (31.655466)*sailStates.q + (0.040572)*sailStates.r + (0.009966)*sailStates.de;
	CD = -0.318660;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.254236)*sailStates.p + (-0.000000)*sailStates.q + (0.050571)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.281761)*sailStates.alpha + (-0.126120)*sailStates.beta + (-1.154611)*sailStates.p + (9.153097)*sailStates.q + (0.279765)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-15.172252)*sailStates.alpha + (-0.077792)*sailStates.beta + (8.845117)*sailStates.p + (-134.847153)*sailStates.q + (-0.072404)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.309823)*sailStates.alpha + (-0.027850)*sailStates.beta + (-0.771980)*sailStates.p + (4.145651)*sailStates.q + (-0.052274)*sailStates.r + (0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end