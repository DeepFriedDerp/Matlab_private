function [aeroForces] = paramSpace_5_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.280149)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.355114)*sailStates.p + (34.401299)*sailStates.q + (-1.136492)*sailStates.r + (0.011061)*sailStates.de;
	CD = -0.163200;
	CY = (0.080307)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.432711)*sailStates.p + (0.322048)*sailStates.q + (-0.045491)*sailStates.r + (0.000069)*sailStates.de;

	Cl = (1.266827)*sailStates.alpha + (0.203383)*sailStates.beta + (-1.029450)*sailStates.p + (8.478742)*sailStates.q + (-0.930146)*sailStates.r + (0.000048)*sailStates.de;
	Cm = (-14.107088)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.676754)*sailStates.p + (-130.700150)*sailStates.q + (3.842314)*sailStates.r + (-0.069118)*sailStates.de;
	Cn = (-0.250793)*sailStates.alpha + (0.021376)*sailStates.beta + (0.869027)*sailStates.p + (-3.851006)*sailStates.q + (0.004929)*sailStates.r + (-0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end