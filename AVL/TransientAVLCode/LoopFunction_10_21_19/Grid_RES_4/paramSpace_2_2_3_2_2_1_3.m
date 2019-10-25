function [aeroForces] = paramSpace_2_2_3_2_2_1_3(sailStates,airStates)

	CL = (4.517966)*sailStates.alpha + (-0.100664)*sailStates.beta + (-2.995335)*sailStates.p + (39.426952)*sailStates.q + (-1.390742)*sailStates.r + (0.011502)*sailStates.de;
	CD = -0.473740;
	CY = (-0.080754)*sailStates.alpha + (-0.025009)*sailStates.beta + (-0.561235)*sailStates.p + (0.100924)*sailStates.q + (-0.036782)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.549292)*sailStates.alpha + (0.245542)*sailStates.beta + (-1.561317)*sailStates.p + (13.355876)*sailStates.q + (-1.204886)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.019642)*sailStates.alpha + (0.378013)*sailStates.beta + (9.876903)*sailStates.p + (-148.239975)*sailStates.q + (4.700400)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.267263)*sailStates.alpha + (0.018474)*sailStates.beta + (1.172227)*sailStates.p + (-5.104825)*sailStates.q + (0.004543)*sailStates.r + (-0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end