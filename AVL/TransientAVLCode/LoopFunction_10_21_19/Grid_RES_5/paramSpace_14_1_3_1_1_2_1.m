function [aeroForces] = paramSpace_14_1_3_1_1_2_1(sailStates,airStates)

	CL = (5.202437)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.054462)*sailStates.p + (36.233673)*sailStates.q + (2.390076)*sailStates.r + (0.011270)*sailStates.de;
	CD = -1.018260;
	CY = (-0.282839)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.923790)*sailStates.p + (-0.550478)*sailStates.q + (-0.196377)*sailStates.r + (-0.000115)*sailStates.de;

	Cl = (1.567986)*sailStates.alpha + (-0.440087)*sailStates.beta + (-0.769989)*sailStates.p + (7.387444)*sailStates.q + (1.966947)*sailStates.r + (-0.000377)*sailStates.de;
	Cm = (-11.520745)*sailStates.alpha + (0.000000)*sailStates.beta + (5.260880)*sailStates.p + (-119.415161)*sailStates.q + (-7.891320)*sailStates.r + (-0.066020)*sailStates.de;
	Cn = (1.039335)*sailStates.alpha + (0.093543)*sailStates.beta + (-1.965834)*sailStates.p + (8.862494)*sailStates.q + (0.034536)*sailStates.r + (0.000289)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end