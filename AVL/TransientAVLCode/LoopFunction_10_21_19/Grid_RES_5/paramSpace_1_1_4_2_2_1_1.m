function [aeroForces] = paramSpace_1_1_4_2_2_1_1(sailStates,airStates)

	CL = (4.183333)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.266176)*sailStates.p + (36.102562)*sailStates.q + (-1.752636)*sailStates.r + (0.010934)*sailStates.de;
	CD = -0.155190;
	CY = (0.076937)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.529081)*sailStates.p + (0.199287)*sailStates.q + (-0.131893)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.242557)*sailStates.alpha + (0.256706)*sailStates.beta + (-0.978891)*sailStates.p + (9.003806)*sailStates.q + (-1.307545)*sailStates.r + (0.000027)*sailStates.de;
	Cm = (-12.562356)*sailStates.alpha + (0.000000)*sailStates.beta + (6.595012)*sailStates.p + (-127.104668)*sailStates.q + (5.750136)*sailStates.r + (-0.065753)*sailStates.de;
	Cn = (-0.207755)*sailStates.alpha + (0.064004)*sailStates.beta + (1.029924)*sailStates.p + (-4.197777)*sailStates.q + (-0.008672)*sailStates.r + (-0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end