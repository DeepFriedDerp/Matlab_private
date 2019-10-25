function [aeroForces] = paramSpace_1_2_1_1_2_1_3(sailStates,airStates)

	CL = (6.188146)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.513256)*sailStates.p + (49.603497)*sailStates.q + (-3.444968)*sailStates.r + (0.012520)*sailStates.de;
	CD = -2.446890;
	CY = (-0.420914)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.348376)*sailStates.p + (0.589407)*sailStates.q + (-0.237811)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (2.072148)*sailStates.alpha + (0.650681)*sailStates.beta + (-1.927179)*sailStates.p + (18.484629)*sailStates.q + (-2.973575)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-10.330929)*sailStates.alpha + (0.000001)*sailStates.beta + (9.791312)*sailStates.p + (-159.507309)*sailStates.q + (11.494078)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (1.840580)*sailStates.alpha + (0.114733)*sailStates.beta + (2.725036)*sailStates.p + (-11.350540)*sailStates.q + (0.015867)*sailStates.r + (-0.000423)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end