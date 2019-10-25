function [aeroForces] = paramSpace_2_1_2_2_1_3_3(sailStates,airStates)

	CL = (4.513725)*sailStates.alpha + (0.176019)*sailStates.beta + (-2.930601)*sailStates.p + (36.719631)*sailStates.q + (0.821692)*sailStates.r + (0.010817)*sailStates.de;
	CD = -0.519990;
	CY = (0.003666)*sailStates.alpha + (-0.024002)*sailStates.beta + (0.502404)*sailStates.p + (-0.668511)*sailStates.q + (0.032953)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.688280)*sailStates.alpha + (-0.170959)*sailStates.beta + (-1.572672)*sailStates.p + (13.033351)*sailStates.q + (0.822993)*sailStates.r + (0.001017)*sailStates.de;
	Cm = (-14.885454)*sailStates.alpha + (-0.674156)*sailStates.beta + (10.343412)*sailStates.p + (-147.557632)*sailStates.q + (-2.765799)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.013942)*sailStates.alpha + (-0.017879)*sailStates.beta + (-1.205367)*sailStates.p + (6.368923)*sailStates.q + (-0.018356)*sailStates.r + (0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end