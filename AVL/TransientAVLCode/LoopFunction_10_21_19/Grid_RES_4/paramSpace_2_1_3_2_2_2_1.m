function [aeroForces] = paramSpace_2_1_3_2_2_2_1(sailStates,airStates)

	CL = (3.944499)*sailStates.alpha + (-0.051242)*sailStates.beta + (-2.145027)*sailStates.p + (31.436073)*sailStates.q + (-0.274172)*sailStates.r + (0.010703)*sailStates.de;
	CD = 0.027810;
	CY = (-0.003945)*sailStates.alpha + (-0.024689)*sailStates.beta + (-0.051345)*sailStates.p + (-0.100923)*sailStates.q + (-0.003369)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.088552)*sailStates.alpha + (0.012571)*sailStates.beta + (-0.919190)*sailStates.p + (7.267153)*sailStates.q + (-0.175312)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-14.335246)*sailStates.alpha + (0.158629)*sailStates.beta + (7.348819)*sailStates.p + (-125.105080)*sailStates.q + (0.921878)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.009480)*sailStates.alpha + (0.001616)*sailStates.beta + (0.074988)*sailStates.p + (-0.158166)*sailStates.q + (-0.002653)*sailStates.r + (0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end