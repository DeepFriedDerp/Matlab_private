function [aeroForces] = paramSpace_1_2_3_2_1_3_3(sailStates,airStates)

	CL = (4.347544)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.845611)*sailStates.p + (35.158558)*sailStates.q + (0.207492)*sailStates.r + (0.010418)*sailStates.de;
	CD = -0.442090;
	CY = (0.006340)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.370325)*sailStates.p + (-0.491415)*sailStates.q + (0.065252)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.518808)*sailStates.alpha + (-0.165556)*sailStates.beta + (-1.486277)*sailStates.p + (12.063213)*sailStates.q + (0.421387)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-15.317507)*sailStates.alpha + (0.000000)*sailStates.beta + (10.428251)*sailStates.p + (-147.390610)*sailStates.q + (-0.655203)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.158132)*sailStates.alpha + (-0.029192)*sailStates.beta + (-1.044662)*sailStates.p + (5.858767)*sailStates.q + (-0.063897)*sailStates.r + (0.000210)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end