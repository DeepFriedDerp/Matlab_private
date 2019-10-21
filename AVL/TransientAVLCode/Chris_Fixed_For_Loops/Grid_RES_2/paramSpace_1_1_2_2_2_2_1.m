function [aeroForces] = paramSpace_1_1_2_2_2_2_1(sailStates,airStates)

	CL = (5.744725)*sailStates.alpha + (0.767874)*sailStates.beta + (-5.952057)*sailStates.p + (54.565937)*sailStates.q + (2.519510)*sailStates.r + (0.010818)*sailStates.de;
	CD = -8.115190;
	CY = (2.664990)*sailStates.alpha + (-0.032590)*sailStates.beta + (1.415141)*sailStates.p + (4.066083)*sailStates.q + (0.186595)*sailStates.r + (0.000922)*sailStates.de;

	Cl = (-1.050046)*sailStates.alpha + (-0.723894)*sailStates.beta + (-4.173130)*sailStates.p + (36.139606)*sailStates.q + (2.696914)*sailStates.r + (0.005582)*sailStates.de;
	Cm = (6.210459)*sailStates.alpha + (-3.188221)*sailStates.beta + (22.339825)*sailStates.p + (-236.220306)*sailStates.q + (-8.503147)*sailStates.r + (-0.081912)*sailStates.de;
	Cn = (-10.168771)*sailStates.alpha + (-0.126101)*sailStates.beta + (-3.843608)*sailStates.p + (16.681404)*sailStates.q + (-0.079351)*sailStates.r + (-0.000682)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end