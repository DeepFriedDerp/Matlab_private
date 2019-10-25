function [aeroForces] = paramSpace_3_2_4_1_2_3_1(sailStates,airStates)

	CL = (6.206143)*sailStates.alpha + (0.201798)*sailStates.beta + (-1.739692)*sailStates.p + (30.484892)*sailStates.q + (2.450590)*sailStates.r + (0.011132)*sailStates.de;
	CD = -2.348080;
	CY = (-0.379077)*sailStates.alpha + (-0.024874)*sailStates.beta + (1.111812)*sailStates.p + (0.221997)*sailStates.q + (-0.072849)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.292630)*sailStates.alpha + (-0.512473)*sailStates.beta + (-0.519856)*sailStates.p + (3.985374)*sailStates.q + (2.248731)*sailStates.r + (-0.000761)*sailStates.de;
	Cm = (-12.432248)*sailStates.alpha + (-0.813280)*sailStates.beta + (5.305434)*sailStates.p + (-112.898659)*sailStates.q + (-8.336183)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (2.020215)*sailStates.alpha + (0.038131)*sailStates.beta + (-2.464802)*sailStates.p + (10.889238)*sailStates.q + (0.016002)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end