function [aeroForces] = paramSpace_1_1_2_3_2_1_3(sailStates,airStates)

	CL = (4.135662)*sailStates.alpha + (-0.309612)*sailStates.beta + (-2.783308)*sailStates.p + (39.207542)*sailStates.q + (-1.623897)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.190060;
	CY = (-0.035719)*sailStates.alpha + (-0.025268)*sailStates.beta + (-0.528935)*sailStates.p + (0.173373)*sailStates.q + (-0.093266)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.436036)*sailStates.alpha + (0.158427)*sailStates.beta + (-1.430527)*sailStates.p + (12.878636)*sailStates.q + (-1.294130)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-12.888642)*sailStates.alpha + (1.146477)*sailStates.beta + (8.698639)*sailStates.p + (-141.665955)*sailStates.q + (5.427199)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.274256)*sailStates.alpha + (0.044768)*sailStates.beta + (0.975609)*sailStates.p + (-3.661417)*sailStates.q + (-0.011687)*sailStates.r + (-0.000138)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end