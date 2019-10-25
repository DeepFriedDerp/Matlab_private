function [aeroForces] = paramSpace_12_1_4_2_2_2_1(sailStates,airStates)

	CL = (4.056810)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.357315)*sailStates.p + (34.769623)*sailStates.q + (1.095662)*sailStates.r + (0.010958)*sailStates.de;
	CD = -0.073060;
	CY = (0.035417)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.350163)*sailStates.p + (0.520429)*sailStates.q + (-0.049157)*sailStates.r + (0.000111)*sailStates.de;

	Cl = (1.120833)*sailStates.alpha + (-0.195953)*sailStates.beta + (-1.031061)*sailStates.p + (8.572149)*sailStates.q + (0.889569)*sailStates.r + (0.000082)*sailStates.de;
	Cm = (-13.423853)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.645835)*sailStates.p + (-130.856766)*sailStates.q + (-3.722601)*sailStates.r + (-0.068597)*sailStates.de;
	Cn = (0.066807)*sailStates.alpha + (0.027539)*sailStates.beta + (-0.670805)*sailStates.p + (2.129057)*sailStates.q + (-0.010755)*sailStates.r + (-0.000111)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end