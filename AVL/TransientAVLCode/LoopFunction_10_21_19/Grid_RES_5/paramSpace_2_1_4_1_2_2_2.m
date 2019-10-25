function [aeroForces] = paramSpace_2_1_4_1_2_2_2(sailStates,airStates)

	CL = (4.175156)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.825155)*sailStates.p + (34.777199)*sailStates.q + (-0.190554)*sailStates.r + (0.010010)*sailStates.de;
	CD = -0.418950;
	CY = (0.198275)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.163229)*sailStates.p + (1.364608)*sailStates.q + (0.034842)*sailStates.r + (0.000291)*sailStates.de;

	Cl = (1.317294)*sailStates.alpha + (-0.135695)*sailStates.beta + (-1.507825)*sailStates.p + (12.585887)*sailStates.q + (0.146322)*sailStates.r + (0.000915)*sailStates.de;
	Cm = (-14.934215)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.231958)*sailStates.p + (-146.890121)*sailStates.q + (0.672008)*sailStates.r + (-0.068730)*sailStates.de;
	Cn = (-0.005506)*sailStates.alpha + (-0.028843)*sailStates.beta + (-0.685264)*sailStates.p + (3.058273)*sailStates.q + (-0.047013)*sailStates.r + (-0.000348)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end