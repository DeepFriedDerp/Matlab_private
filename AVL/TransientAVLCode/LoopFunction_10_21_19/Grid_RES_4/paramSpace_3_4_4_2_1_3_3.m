function [aeroForces] = paramSpace_3_4_4_2_1_3_3(sailStates,airStates)

	CL = (4.712993)*sailStates.alpha + (-0.372037)*sailStates.beta + (-2.967493)*sailStates.p + (39.236492)*sailStates.q + (1.607846)*sailStates.r + (0.011269)*sailStates.de;
	CD = -0.621620;
	CY = (0.007531)*sailStates.alpha + (-0.023582)*sailStates.beta + (0.715033)*sailStates.p + (-0.870358)*sailStates.q + (-0.046958)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.669002)*sailStates.alpha + (-0.425857)*sailStates.beta + (-1.481868)*sailStates.p + (12.490116)*sailStates.q + (1.411342)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.040861)*sailStates.alpha + (1.499506)*sailStates.beta + (9.714826)*sailStates.p + (-146.834106)*sailStates.q + (-5.471120)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.166880)*sailStates.alpha + (0.018253)*sailStates.beta + (-1.475481)*sailStates.p + (6.906444)*sailStates.q + (0.010384)*sailStates.r + (0.000360)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end