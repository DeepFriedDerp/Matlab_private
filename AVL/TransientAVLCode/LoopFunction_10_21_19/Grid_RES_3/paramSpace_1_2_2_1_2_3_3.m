function [aeroForces] = paramSpace_1_2_2_1_2_3_3(sailStates,airStates)

	CL = (5.485762)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.210578)*sailStates.p + (35.424023)*sailStates.q + (1.058504)*sailStates.r + (0.009779)*sailStates.de;
	CD = -1.958920;
	CY = (0.344660)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.743893)*sailStates.p + (0.589407)*sailStates.q + (0.131168)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (1.797599)*sailStates.alpha + (-0.395458)*sailStates.beta + (-1.831572)*sailStates.p + (14.753894)*sailStates.q + (1.231500)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-15.032351)*sailStates.alpha + (0.000001)*sailStates.beta + (12.426315)*sailStates.p + (-159.507309)*sailStates.q + (-3.449767)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (-0.670776)*sailStates.alpha + (-0.069730)*sailStates.beta + (-2.005436)*sailStates.p + (9.807506)*sailStates.q + (-0.079520)*sailStates.r + (0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end