function [aeroForces] = paramSpace_5_1_3_1_1_1_1(sailStates,airStates)

	CL = (4.509598)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.114431)*sailStates.p + (33.270512)*sailStates.q + (-1.453418)*sailStates.r + (0.011262)*sailStates.de;
	CD = -0.593180;
	CY = (-0.041228)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.526844)*sailStates.p + (-1.178226)*sailStates.q + (-0.055415)*sailStates.r + (-0.000251)*sailStates.de;

	Cl = (0.923214)*sailStates.alpha + (0.310887)*sailStates.beta + (-0.812708)*sailStates.p + (6.567089)*sailStates.q + (-1.259301)*sailStates.r + (-0.000286)*sailStates.de;
	Cm = (-12.966963)*sailStates.alpha + (0.000000)*sailStates.beta + (6.694972)*sailStates.p + (-123.632645)*sailStates.q + (4.911094)*sailStates.r + (-0.068451)*sailStates.de;
	Cn = (-0.488738)*sailStates.alpha + (0.032676)*sailStates.beta + (1.162853)*sailStates.p + (-4.275429)*sailStates.q + (-0.001111)*sailStates.r + (0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end