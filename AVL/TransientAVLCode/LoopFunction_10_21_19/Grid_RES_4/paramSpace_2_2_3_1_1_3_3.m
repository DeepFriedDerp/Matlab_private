function [aeroForces] = paramSpace_2_2_3_1_1_3_3(sailStates,airStates)

	CL = (6.918423)*sailStates.alpha + (0.168673)*sailStates.beta + (-3.410587)*sailStates.p + (39.375668)*sailStates.q + (2.219820)*sailStates.r + (0.010979)*sailStates.de;
	CD = -2.800080;
	CY = (0.277434)*sailStates.alpha + (-0.024503)*sailStates.beta + (1.219889)*sailStates.p + (-1.471502)*sailStates.q + (0.079904)*sailStates.r + (-0.000322)*sailStates.de;

	Cl = (2.813268)*sailStates.alpha + (-0.502459)*sailStates.beta + (-1.939413)*sailStates.p + (15.962914)*sailStates.q + (2.128174)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-15.870257)*sailStates.alpha + (-0.670059)*sailStates.beta + (12.400071)*sailStates.p + (-162.286758)*sailStates.q + (-7.519199)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (-1.094586)*sailStates.alpha + (-0.038061)*sailStates.beta + (-2.804177)*sailStates.p + (14.241861)*sailStates.q + (-0.035965)*sailStates.r + (0.000688)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end