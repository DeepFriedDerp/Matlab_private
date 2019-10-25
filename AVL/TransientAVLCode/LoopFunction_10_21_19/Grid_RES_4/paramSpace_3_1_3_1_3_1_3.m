function [aeroForces] = paramSpace_3_1_3_1_3_1_3(sailStates,airStates)

	CL = (6.813089)*sailStates.alpha + (-0.483547)*sailStates.beta + (-3.390728)*sailStates.p + (39.126320)*sailStates.q + (-2.212288)*sailStates.r + (0.010781)*sailStates.de;
	CD = -2.766640;
	CY = (-0.273491)*sailStates.alpha + (-0.023061)*sailStates.beta + (-1.205298)*sailStates.p + (1.471501)*sailStates.q + (0.079051)*sailStates.r + (0.000320)*sailStates.de;

	Cl = (2.821563)*sailStates.alpha + (0.398595)*sailStates.beta + (-1.962590)*sailStates.p + (16.291513)*sailStates.q + (-2.103076)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-15.561623)*sailStates.alpha + (1.867718)*sailStates.beta + (12.329535)*sailStates.p + (-161.242615)*sailStates.q + (7.468352)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.127839)*sailStates.alpha + (-0.042089)*sailStates.beta + (2.784682)*sailStates.p + (-14.258674)*sailStates.q + (-0.036319)*sailStates.r + (-0.000699)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end