function [aeroForces] = paramSpace_4_1_4_1_1_2_2(sailStates,airStates)

	CL = (4.787953)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.983170)*sailStates.p + (35.871391)*sailStates.q + (0.704793)*sailStates.r + (0.010580)*sailStates.de;
	CD = -0.824050;
	CY = (0.043421)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.575299)*sailStates.p + (-0.696926)*sailStates.q + (0.080779)*sailStates.r + (-0.000151)*sailStates.de;

	Cl = (1.741659)*sailStates.alpha + (-0.259690)*sailStates.beta + (-1.590846)*sailStates.p + (12.825923)*sailStates.q + (0.841745)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-15.644409)*sailStates.alpha + (-0.000000)*sailStates.beta + (11.009333)*sailStates.p + (-151.165665)*sailStates.q + (-2.356457)*sailStates.r + (-0.070716)*sailStates.de;
	Cn = (-0.014593)*sailStates.alpha + (-0.036497)*sailStates.beta + (-1.462851)*sailStates.p + (7.774128)*sailStates.q + (-0.056111)*sailStates.r + (0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end