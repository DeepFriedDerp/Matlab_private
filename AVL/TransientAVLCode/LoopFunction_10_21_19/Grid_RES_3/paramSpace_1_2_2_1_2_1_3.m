function [aeroForces] = paramSpace_1_2_2_1_2_1_3(sailStates,airStates)

	CL = (6.205344)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.514427)*sailStates.p + (49.544613)*sailStates.q + (-3.431593)*sailStates.r + (0.012629)*sailStates.de;
	CD = -2.429860;
	CY = (-0.413463)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.328615)*sailStates.p + (0.589406)*sailStates.q + (-0.234271)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (2.073885)*sailStates.alpha + (0.640796)*sailStates.beta + (-1.927691)*sailStates.p + (18.482021)*sailStates.q + (-2.941090)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-10.571317)*sailStates.alpha + (0.000000)*sailStates.beta + (9.804914)*sailStates.p + (-159.507309)*sailStates.q + (11.416942)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (1.816007)*sailStates.alpha + (0.112990)*sailStates.beta + (2.695326)*sailStates.p + (-11.335755)*sailStates.q + (0.016599)*sailStates.r + (-0.000444)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end