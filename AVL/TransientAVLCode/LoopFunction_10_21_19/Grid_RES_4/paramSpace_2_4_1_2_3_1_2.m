function [aeroForces] = paramSpace_2_4_1_2_3_1_2(sailStates,airStates)

	CL = (4.782568)*sailStates.alpha + (0.364506)*sailStates.beta + (-2.565348)*sailStates.p + (35.977692)*sailStates.q + (-1.554112)*sailStates.r + (0.011068)*sailStates.de;
	CD = -0.617350;
	CY = (0.098826)*sailStates.alpha + (-0.023721)*sailStates.beta + (-0.698556)*sailStates.p + (0.769435)*sailStates.q + (-0.045867)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.534454)*sailStates.alpha + (0.415983)*sailStates.beta + (-1.153330)*sailStates.p + (9.441257)*sailStates.q + (-1.367695)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.253250)*sailStates.alpha + (-1.473297)*sailStates.beta + (8.372533)*sailStates.p + (-135.788696)*sailStates.q + (5.288386)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.304385)*sailStates.alpha + (0.017905)*sailStates.beta + (1.463312)*sailStates.p + (-6.879689)*sailStates.q + (0.011026)*sailStates.r + (-0.000323)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end