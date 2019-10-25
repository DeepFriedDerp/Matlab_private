function [aeroForces] = paramSpace_11_1_3_1_2_2_1(sailStates,airStates)

	CL = (4.502664)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.114106)*sailStates.p + (33.296719)*sailStates.q + (1.461441)*sailStates.r + (0.011214)*sailStates.de;
	CD = -0.602420;
	CY = (0.038068)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.541610)*sailStates.p + (1.178226)*sailStates.q + (-0.056884)*sailStates.r + (0.000251)*sailStates.de;

	Cl = (0.919178)*sailStates.alpha + (-0.318266)*sailStates.beta + (-0.812541)*sailStates.p + (6.568311)*sailStates.q + (1.282756)*sailStates.r + (-0.000286)*sailStates.de;
	Cm = (-12.852271)*sailStates.alpha + (0.000000)*sailStates.beta + (6.690183)*sailStates.p + (-123.632645)*sailStates.q + (-4.956655)*sailStates.r + (-0.068451)*sailStates.de;
	Cn = (0.497207)*sailStates.alpha + (0.033451)*sailStates.beta + (-1.184752)*sailStates.p + (4.287055)*sailStates.q + (-0.001433)*sailStates.r + (-0.000252)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end