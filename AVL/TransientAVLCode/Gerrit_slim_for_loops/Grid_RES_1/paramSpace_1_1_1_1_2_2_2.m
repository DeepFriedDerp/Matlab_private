function [aeroForces] = paramSpace_1_1_1_1_2_2_2(sailStates,airStates)

	CL = (9.206837)*sailStates.alpha + (-0.207483)*sailStates.beta + (-2.368284)*sailStates.p + (33.597675)*sailStates.q + (-2.429624)*sailStates.r + (0.009755)*sailStates.de;
	CD = -1.782240;
	CY = (1.962482)*sailStates.alpha + (-0.059142)*sailStates.beta + (-1.551945)*sailStates.p + (14.687107)*sailStates.q + (-0.205358)*sailStates.r + (0.003108)*sailStates.de;

	Cl = (5.088485)*sailStates.alpha + (0.022751)*sailStates.beta + (-1.221131)*sailStates.p + (11.500606)*sailStates.q + (-1.687401)*sailStates.r + (0.000143)*sailStates.de;
	Cm = (-25.083260)*sailStates.alpha + (0.547998)*sailStates.beta + (6.875268)*sailStates.p + (-128.487900)*sailStates.q + (7.980512)*sailStates.r + (-0.067454)*sailStates.de;
	Cn = (-1.920868)*sailStates.alpha + (0.062792)*sailStates.beta + (2.894735)*sailStates.p + (-23.374886)*sailStates.q + (0.181602)*sailStates.r + (-0.004350)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end