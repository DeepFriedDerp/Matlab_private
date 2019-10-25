function [aeroForces] = paramSpace_2_2_4_1_3_1_2(sailStates,airStates)

	CL = (7.634501)*sailStates.alpha + (-0.205911)*sailStates.beta + (-2.607970)*sailStates.p + (37.696869)*sailStates.q + (-2.984717)*sailStates.r + (0.011619)*sailStates.de;
	CD = -2.932870;
	CY = (0.227740)*sailStates.alpha + (-0.025401)*sailStates.beta + (-1.376957)*sailStates.p + (1.693498)*sailStates.q + (-0.090072)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (2.905792)*sailStates.alpha + (0.554422)*sailStates.beta + (-1.232280)*sailStates.p + (10.719066)*sailStates.q + (-2.634183)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-15.408492)*sailStates.alpha + (0.764854)*sailStates.beta + (8.073496)*sailStates.p + (-136.398376)*sailStates.q + (10.063467)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.580068)*sailStates.alpha + (0.042086)*sailStates.beta + (2.987487)*sailStates.p + (-14.715947)*sailStates.q + (0.028002)*sailStates.r + (-0.000752)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end