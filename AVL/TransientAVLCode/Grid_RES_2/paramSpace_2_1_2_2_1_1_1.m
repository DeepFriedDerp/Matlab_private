function [aeroForces] = paramSpace_2_1_2_2_1_1_1(sailStates,airStates)

	CL = (5.711809)*sailStates.alpha + (-1.944107)*sailStates.beta + (-3.641851)*sailStates.p + (50.086056)*sailStates.q + (2.214287)*sailStates.r + (0.012600)*sailStates.de;
	CD = -5.426230;
	CY = (1.875713)*sailStates.alpha + (-0.128444)*sailStates.beta + (0.332580)*sailStates.p + (14.616285)*sailStates.q + (-0.036539)*sailStates.r + (0.003092)*sailStates.de;

	Cl = (-4.608742)*sailStates.alpha + (-1.025959)*sailStates.beta + (-1.840501)*sailStates.p + (15.927409)*sailStates.q + (2.416054)*sailStates.r + (0.001551)*sailStates.de;
	Cm = (2.218517)*sailStates.alpha + (8.723288)*sailStates.beta + (11.402470)*sailStates.p + (-163.347366)*sailStates.q + (-7.818370)*sailStates.r + (-0.068095)*sailStates.de;
	Cn = (-2.116093)*sailStates.alpha + (0.215073)*sailStates.beta + (-0.914277)*sailStates.p + (-8.127402)*sailStates.q + (-0.183833)*sailStates.r + (-0.004044)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end