function [aeroForces] = paramSpace_1_3_3_3_3_3_2(sailStates,airStates)

	CL = (3.988573)*sailStates.alpha + (0.017085)*sailStates.beta + (-2.429053)*sailStates.p + (32.945301)*sailStates.q + (-0.330523)*sailStates.r + (0.010297)*sailStates.de;
	CD = -0.071620;
	CY = (0.059824)*sailStates.alpha + (-0.023714)*sailStates.beta + (0.048193)*sailStates.p + (0.491627)*sailStates.q + (0.008545)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.124434)*sailStates.alpha + (-0.026008)*sailStates.beta + (-1.102651)*sailStates.p + (8.763576)*sailStates.q + (-0.052705)*sailStates.r + (0.000188)*sailStates.de;
	Cm = (-14.692122)*sailStates.alpha + (0.044112)*sailStates.beta + (8.506640)*sailStates.p + (-133.990982)*sailStates.q + (1.108546)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (0.132319)*sailStates.alpha + (-0.004951)*sailStates.beta + (-0.275264)*sailStates.p + (1.305735)*sailStates.q + (-0.023873)*sailStates.r + (-0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end