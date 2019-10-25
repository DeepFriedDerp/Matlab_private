function [aeroForces] = paramSpace_7_1_4_1_1_1_1(sailStates,airStates)

	CL = (4.483632)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.088260)*sailStates.p + (31.620800)*sailStates.q + (-1.154400)*sailStates.r + (0.011052)*sailStates.de;
	CD = -0.555530;
	CY = (-0.036483)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.455097)*sailStates.p + (-1.046668)*sailStates.q + (-0.016003)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (0.931027)*sailStates.alpha + (0.269920)*sailStates.beta + (-0.804217)*sailStates.p + (6.124576)*sailStates.q + (-1.047116)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-13.893441)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.014328)*sailStates.p + (-123.745377)*sailStates.q + (3.909459)*sailStates.r + (-0.069078)*sailStates.de;
	Cn = (-0.483280)*sailStates.alpha + (0.009426)*sailStates.beta + (1.048961)*sailStates.p + (-4.081316)*sailStates.q + (0.000990)*sailStates.r + (0.000208)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end